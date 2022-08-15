//
//  HomeViewController.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/19/22.
//

import UIKit

class HomeViewController: UIViewController {
    var searchController: UISearchController!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CarCell.self, forCellReuseIdentifier: CarCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        return tableView
    }()
    
    var viewModels = [Car]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var filteredModels = [Car]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "CarBuddy"
        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchController
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        viewModels = (UIApplication.shared.delegate as? AppDelegate)?.fetchCars() ?? []
        filteredModels = []// viewModels
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredModels.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedViewModel = filteredModels[indexPath.row]
        let detailsViewController = FavoritesDetailsViewController()
        detailsViewController.configure(viewModel: selectedViewModel)
        
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.reuseIdentifier, for: indexPath) as? CarCell else { return UITableViewCell() }
        let viewModel = filteredModels[indexPath.row]
        cell.configure(viewModel)
        return cell
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UISearchResultsUpdating {
    private func findMatches(searchString: String) -> NSCompoundPredicate {
        var searchItemsPredicate = [NSPredicate]()

        let searchStringExpression = NSExpression(forConstantValue: searchString)
        // Car make matching.
        let makeExpression = NSExpression(forKeyPath: Car.ExpressionKeys.make.rawValue)
        let makeSearchComparisonPredicate =
        NSComparisonPredicate(leftExpression: makeExpression,
                              rightExpression: searchStringExpression,
                              modifier: .direct,
                              type: .contains,
                              options: [.caseInsensitive, .diacriticInsensitive])
        
        searchItemsPredicate.append(makeSearchComparisonPredicate)
        
        // Car model matching.
        let modelExpression = NSExpression(forKeyPath: Car.ExpressionKeys.model.rawValue)
        let modelSearchComparisonPredicate =
        NSComparisonPredicate(leftExpression: modelExpression,
                              rightExpression: searchStringExpression,
                              modifier: .direct,
                              type: .contains,
                              options: [.caseInsensitive, .diacriticInsensitive])
        
        searchItemsPredicate.append(modelSearchComparisonPredicate)
        
        // Car year matching.
        let yearExpression = NSExpression(forKeyPath: Car.ExpressionKeys.year.rawValue)
        let yearSearchComparisonPredicate =
        NSComparisonPredicate(leftExpression: yearExpression,
                              rightExpression: searchStringExpression,
                              modifier: .direct,
                              type: .contains,
                              options: [.caseInsensitive, .diacriticInsensitive])
        
        searchItemsPredicate.append(yearSearchComparisonPredicate)
        

        return NSCompoundPredicate(orPredicateWithSubpredicates: searchItemsPredicate)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // Update the filtered array based on the search text.
        let searchResults = viewModels
        
        // Strip out all the leading and trailing spaces.
        let whitespaceCharacterSet = CharacterSet.whitespaces
        let strippedString =
        searchController.searchBar.text!.trimmingCharacters(in: whitespaceCharacterSet)
        let searchItems = strippedString.components(separatedBy: " ") as [String]
        
        // Build all the "AND" expressions for each value in searchString.
        let andMatchPredicates: [NSPredicate] = searchItems.map { searchString in
            findMatches(searchString: searchString)
        }
        
        // Match up the fields of the Product object.
        let finalCompoundPredicate =
        NSCompoundPredicate(andPredicateWithSubpredicates: andMatchPredicates)
        
        let filteredResults = searchResults.filter { finalCompoundPredicate.evaluate(with: $0) }
        filteredModels = filteredResults
    }
}
