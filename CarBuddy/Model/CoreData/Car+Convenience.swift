//
//  Car+Convenience.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import CoreData

extension Car {

    /// NSPredicate expression keys for searching.
    enum ExpressionKeys: String {
        case make
        case model
        case year
        case imageURL
    }
    
    @discardableResult convenience init(
        make: String,
        model: String,
        year: String,
        imageURL: String?,
        liked: Bool = false,
        context: NSManagedObjectContext = CoreDataStack.context
    ) {
      self.init(context: context)
        self.make = make
        self.model = model
        self.year = year
        self.imageURL = imageURL
        self.liked = liked
    }
}



