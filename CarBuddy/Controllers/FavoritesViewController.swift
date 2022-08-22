//
//  FavoritesViewController.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/24/22.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {

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
    
    fileprivate func setCars() {
        let cars = (UIApplication.shared.delegate as? AppDelegate)?.fetchCars() ?? []
        viewModels = cars.filter { $0.liked }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCars()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Favorites"
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - UITableViewDelegate
extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedViewModel = viewModels[indexPath.row]
        let detailsViewController = CarDetailsViewController()
        detailsViewController.configure(viewModel: selectedViewModel)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedViewModel = viewModels[indexPath.row]
            selectedViewModel.liked = false
            CoreDataStack.saveContext()
            self.viewModels.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.reuseIdentifier, for: indexPath) as? CarCell else { return UITableViewCell() }
        let viewModel = viewModels[indexPath.row]
        cell.configure(viewModel)
        return cell
    }
}
