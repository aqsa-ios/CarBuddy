//
//  SavedViewController.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/24/22.
//

import Foundation
import UIKit

class SavedViewController: UIViewController {
    var searchController: UISearchController!
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SavedCell.self, forCellReuseIdentifier: SavedCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        return tableView
    }()
    
    var viewModels = [CarUpload]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Saved Searches"
        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchController
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // Do any additional setup after loading the view.
        let toyota = CarUpload(vin: nil, make: "Toyota", model: "Camry SE", year: "2021")
        let bmw = CarUpload(vin: nil, make: "BMW", model: "i8", year: "2021")
        let maserati = CarUpload(vin: nil, make: "Maserati", model: "Ghibli", year: "2011")
        viewModels.append(toyota)
        viewModels.append(bmw)
        viewModels.append(maserati)
    }
}

// MARK: - UITableViewDelegate
extension SavedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedViewModel = viewModels[indexPath.row]
        let detailsViewController = SavedDetailsViewController()
        detailsViewController.configure(viewModel: selectedViewModel)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.reuseIdentifier, for: indexPath) as? SavedCell else { return UITableViewCell() }
        let viewModel = viewModels[indexPath.row]
        cell.configure(viewModel)
        return cell
    }
}

// MARK: - UISearchBarDelegate
extension SavedViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let query = searchBar.text {
            
        }
    }
}


