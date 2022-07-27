//
//  HomeView.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import UIKit

protocol CarSelectionDelegate: AnyObject {
    func paymentError()
    func carSelected(_ submission: CarUpload)
}

public class HomeView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "Welcome Back!".uppercased()
        return label
    }()
    
    lazy var yearButton: UIButton = {
        let label = UIButton(type: .system)
        label.setTitle("Select Year", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var modelButton: UIButton = {
        let label = UIButton(type: .system)
        label.setTitle("Select Model", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var makeButton: UIButton = {
        let label = UIButton(type: .system)
        label.setTitle("Select Make", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var submitButton: UIButton = {
        let label = UIButton(type: .system)
        label.setTitle("Submit", for: .normal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, yearButton, makeButton, modelButton, submitButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(stack)
        stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
