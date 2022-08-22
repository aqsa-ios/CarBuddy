//
//  CarDetailsViewController.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import UIKit

class CarDetailsViewController: UIViewController {
    lazy var carDetailsView: CarDetailsView = {
        let view = CarDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(carDetailsView)
        carDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        carDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        carDetailsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        carDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    public func configure(viewModel: Car) {
        carDetailsView.configure(viewModel)
        
        DispatchQueue.global().async {
            Networker.retrieveCarDetails(viewModel, completion: { result in
                switch result {
                case .success(let carDetails):
                    if let carDetails = carDetails.first {
                        self.carDetailsView.configure(carDetails)
                    }
                case .failure(let error):
                    print(error.errorDescription)
                }
            })
        }
    }
}
