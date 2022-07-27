//
//  SavedDetailsViewController.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import UIKit

class SavedDetailsViewController: UIViewController {
    lazy var carDetailsView: CarDetailsView = {
        let view = CarDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    public func configure(viewModel: CarUpload) {
        carDetailsView.configure(viewModel: viewModel)
    }
}
