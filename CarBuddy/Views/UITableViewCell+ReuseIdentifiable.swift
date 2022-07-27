//
//  UITableViewCell+ReuseIdentifiable.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import UIKit

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
