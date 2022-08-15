//
//  CarCell.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import UIKit

class CarCell: UITableViewCell {
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private lazy var makeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var carHorizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [makeLabel, modelLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [yearLabel, carHorizontalStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.setCustomSpacing(10, after: makeLabel)
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [carImageView, verticalStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.setCustomSpacing(20, after: carImageView)
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        makeLabel.text = nil
        modelLabel.text = nil
        yearLabel.text = nil
        carImageView.image = nil
    }
    
    private func setup() {
        contentView.addSubview(horizontalStack)
        horizontalStack
            .topAnchor
            .constraint(equalTo: super.contentView.topAnchor)
            .isActive = true
        horizontalStack
            .bottomAnchor
            .constraint(equalTo: super.contentView.bottomAnchor)
            .isActive = true
        horizontalStack
            .leadingAnchor
            .constraint(equalTo: super.contentView.leadingAnchor, constant: 16)
            .isActive = true
        horizontalStack
            .trailingAnchor
            .constraint(equalTo: super.contentView.trailingAnchor, constant: -16)
            .isActive = true
        carImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    public func configure(_ viewModel: Car) {
        makeLabel.text = viewModel.make
        modelLabel.text = viewModel.model
        yearLabel.text = viewModel.year

        let path = viewModel.imageURL?.split(separator: "/").map { String($0) }.last ?? ""
        if let image = UIImage(named: path) {
            carImageView.image = image
        } else if let imageURL = viewModel.imageURL, let url = URL(string: imageURL) {
            carImageView.af.setImage(withURL: url)
        } 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
