//
//  SavedCell.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import UIKit

class SavedCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private lazy var releaseLabel: UILabel = {
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
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, releaseLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.setCustomSpacing(10, after: titleLabel)
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
        titleLabel.text = nil
        releaseLabel.text = nil
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
    
    public func configure(_ viewModel: CarUpload) {
        titleLabel.text = viewModel.make
        releaseLabel.text = viewModel.model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
