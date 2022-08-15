//
//  CarDetailsView.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import UIKit

class CarDetailsView: UIView {
    private var car: Car? = nil
    
    private lazy var makeLabel: UILabel = {
        let label = UILabel()
        label.text = "Make"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.sizeToFit()
        return label
    }()
    
    private lazy var makeValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    
    private lazy var modelLabel: UILabel = {
        let label = UILabel()
        label.text = "Model"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.sizeToFit()
        return label
    }()
    
    private lazy var modelValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.text = "Year"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.sizeToFit()
        return label
    }()
    
    private lazy var yearValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private lazy var transmissionLabel: UILabel = {
        let label = UILabel()
        label.text = "Transmission"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.sizeToFit()
        return label
    }()
    
    private lazy var transmissionValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private lazy var classLabel: UILabel = {
        let label = UILabel()
        label.text = "Body Type"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.sizeToFit()
        return label
    }()
    
    private lazy var classValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private lazy var fuelTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Fuel Type"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.sizeToFit()
        return label
    }()
    
    private lazy var fuelTypeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "City MPG"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.sizeToFit()
        return label
    }()
    
    private lazy var cityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private lazy var highwayLabel: UILabel = {
        let label = UILabel()
        label.text = "Highway MPG"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.sizeToFit()
        return label
    }()
    
    private lazy var highwayValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private lazy var comboLabel: UILabel = {
        let label = UILabel()
        label.text = "Combination MPG"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.sizeToFit()
        return label
    }()
    
    private lazy var comboValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()

    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        let favoritesTabBarItemImage = UIImage(systemName: "heart")
        button.setImage(favoritesTabBarItemImage, for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [carImageView,
                                                   saveButton,
                                                   makeStack,
                                                   modelStack,
                                                   yearStack,
                                                   classStack,
                                                   transmissionStack,
                                                   fuelTypeStack,
                                                   cityStack,
                                                   highwayStack,
                                                   comboStack
                                                  ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.setCustomSpacing(.zero, after: carImageView)
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var makeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [makeLabel, makeValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(5, after: makeLabel)
        return stack
    }()
    
    private lazy var modelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [modelLabel, modelValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(5, after: modelLabel)
        return stack
    }()
    
    private lazy var yearStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [yearLabel, yearValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(5, after: yearLabel)
        return stack
    }()
    
    private lazy var classStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [classLabel, classValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(5, after: classLabel)
        return stack
    }()
    
    private lazy var transmissionStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [transmissionLabel, transmissionValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(5, after: transmissionLabel)
        return stack
    }()
    
    private lazy var fuelTypeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [fuelTypeLabel, fuelTypeImageView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(5, after: fuelTypeLabel)
        return stack
    }()
    
    private lazy var cityStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cityLabel, cityValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(1, after: cityLabel)
        return stack
    }()
    
    private lazy var highwayStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [highwayLabel, highwayValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(1, after: highwayLabel)
        return stack
    }()
    
    private lazy var comboStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [comboLabel, comboValueLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.setCustomSpacing(1, after: comboLabel)
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toggle() {
        guard let car = car else { return }
        
        if car.liked {
            let favoritesTabBarItemFilledImage = UIImage(systemName: "heart")
            saveButton.setImage(favoritesTabBarItemFilledImage, for: .normal)
            car.liked = false
        } else {
            let favoritesTabBarItemFilledImage = UIImage(systemName: "heart.fill")
            saveButton.setImage(favoritesTabBarItemFilledImage, for: .normal)
            car.liked = true
        }
        
        CoreDataStack.saveContext()
    }
    
    private func setup() {
        addSubview(verticalStack)
        verticalStack
            .bottomAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            .isActive = true
        verticalStack
            .topAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
            .isActive = true
        verticalStack
            .leftAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16)
            .isActive = true
        verticalStack
            .rightAnchor
            .constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
            .isActive = true
    }
    
    public func configure(_ viewModel: Car) {
        makeValueLabel.text = viewModel.make
        modelValueLabel.text = viewModel.model
        yearValueLabel.text = viewModel.year
        
        self.car = viewModel

        let path = viewModel.imageURL?.split(separator: "/").map { String($0) }.last ?? ""
        if let image = UIImage(named: path) {
            carImageView.image = image
        } else if let imageURL = viewModel.imageURL, let url = URL(string: imageURL) {
            carImageView.af.setImage(withURL: url)
        }
        
        if viewModel.liked {
            let favoritesTabBarItemFilledImage = UIImage(systemName: "heart.fill")
            saveButton.setImage(favoritesTabBarItemFilledImage, for: .normal)
        } else {
            let favoritesTabBarItemImage = UIImage(systemName: "heart")
            saveButton.setImage(favoritesTabBarItemImage, for: .normal)
        }
    }
    
    public func configure(_ details: CarDetailsReponse) {
        DispatchQueue.main.async {
            self.classValueLabel.text = "\(details.class!)"
            
            if let transmission = details.transmission, transmission.caseInsensitiveCompare("a") == .orderedSame {
                self.transmissionValueLabel.text = "Automatic"
            } else {
                self.transmissionValueLabel.text = "Manual"
            }
            
            if details.fuelType == "electricity" {
                self.fuelTypeImageView.image = UIImage(systemName: "bolt.car")
            } else {
                self.fuelTypeImageView.image = UIImage(systemName: "fuelpump")
            }
            
            self.cityValueLabel.text = "\(details.cityMpg!)"
            self.highwayValueLabel.text = "\(details.highwayMpg!)"
            self.comboValueLabel.text = "\(details.combinationMpg!)"
            self.layoutSubviews()
        }
    }
}
