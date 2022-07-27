//
//  HomeViewController.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/19/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var delegate: CarSelectionDelegate?
    
    var carSubmission: CarUpload?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    func setupViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Car Buddy"
        let homeView = HomeView()
        homeView.translatesAutoresizingMaskIntoConstraints = false
        homeView.yearButton.addTarget(self, action: #selector(selectYear(_:)), for: .touchUpInside)
        homeView.modelButton.addTarget(self, action: #selector(selectModel(_:)), for: .touchUpInside)
        homeView.makeButton.addTarget(self, action: #selector(selectMake(_:)), for: .touchUpInside)
        homeView.submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        view.addSubview(homeView)
        NSLayoutConstraint.activate(
            [homeView.topAnchor.constraint(equalTo: view.topAnchor),
             homeView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
             homeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
             homeView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            ]
        )
        
        Networker.retrieveCredits { result in
            switch result {
            case .success(let credit):
                print("\(credit.credits) remaining")
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
    @objc func submit() {
        if let carSubmission = carSubmission {
            delegate?.carSelected(carSubmission)
        } else {
            
        }
    }
    
    @objc func selectYear(_ sender: UIButton) {
        let data: [[String]] = [["2012", "2013", "2014", "2015"]]
        
        Picker.showAsPopover(data: data,
                             fromViewController: self,
                             sourceView: sender,
                             doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let year = selections[0] {
                let temp = self?.carSubmission
                self?.carSubmission = CarUpload(vin: temp?.vin,
                                                make: temp?.make,
                                                model: temp?.model,
                                                year: year)
            }
        }, cancelHandler: { () -> Void in
            print("Canceled Popover")
        }, selectionChangedHandler: { (selections: [Int:String], componentThatChanged: Int) -> Void  in
            let newSelection = selections[componentThatChanged] ?? "Failed to get new selection!"
            print("Component \(componentThatChanged) changed value to \(newSelection)")
        })
    }
    
    @objc func selectModel(_ sender: UIButton) {
        let data: [[String]] = [["Tesla", "Volkswagen", "Aston Martin", "General Motors Lucid Tesla Apple"]]
        
        Picker.showAsPopover(data: data,
                             fromViewController: self,
                             sourceView: sender,
                             doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let model = selections[0] {
                let temp = self?.carSubmission
                self?.carSubmission = CarUpload(vin: temp?.vin,
                                                make: temp?.make,
                                                model: model,
                                                year: temp?.year)
            }
        }, cancelHandler: { () -> Void in
            print("Canceled Popover")
        }, selectionChangedHandler: { (selections: [Int:String], componentThatChanged: Int) -> Void  in
            let newSelection = selections[componentThatChanged] ?? "Failed to get new selection!"
            print("Component \(componentThatChanged) changed value to \(newSelection)")
        })
    }
    
    @objc func selectMake(_ sender: UIButton) {
        let data: [[String]] = [["Tesla", "Volkswagen", "Aston Martin", "General Motors Lucid Tesla Apple"]]
        
        Picker.showAsPopover(data: data,
                             fromViewController: self,
                             sourceView: sender,
                             doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let make = selections[0] {
                let temp = self?.carSubmission
                self?.carSubmission = CarUpload(vin: temp?.vin,
                                                make: make,
                                                model: temp?.model,
                                                year: temp?.year)
            }
        }, cancelHandler: { () -> Void in
            print("Canceled Popover")
        }, selectionChangedHandler: { (selections: [Int:String], componentThatChanged: Int) -> Void  in
            let newSelection = selections[componentThatChanged] ?? "Failed to get new selection!"
            print("Component \(componentThatChanged) changed value to \(newSelection)")
        })
    }
}
