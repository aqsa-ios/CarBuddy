//
//  NoResultsView.swift
//  CarBuddy
//
//  Created by Aqsa on 8/15/22.
//

import Foundation
import UIKit

class NoResultsView: UIView {
    
    private lazy var landingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var landingLabel: UILabel = {
        let label = UILabel()
        label.text = "Search for your drive"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(landingLabel)
        addSubview(landingImageView)
        landingLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        landingLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        landingLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        landingLabel.heightAnchor.constraint(equalToConstant: 140).isActive = true
        landingImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35).isActive = true
        landingImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65).isActive = true
        landingImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        landingImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        landingImageView.image = UIImage(systemName: "car.2")
    }
    
    func setImage(_ image: UIImage) {
        landingImageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
