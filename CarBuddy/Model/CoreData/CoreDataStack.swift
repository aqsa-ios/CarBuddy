//
//  CoreDataStack.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import CoreData

enum CoreDataStack {
    // creating our container
    static let container: NSPersistentContainer = {
                                            // name has to be EXACT to the project file
        let container = NSPersistentContainer(name: "CarBuddy")
        // loading persistent store, check for failure, return container
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading persistent stores \(error)")
            }
        }
        return container
    }()

    // creating context
    static var context: NSManagedObjectContext { container.viewContext }

    static func saveContext() {
        // check for changes, save or log error
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context \(error)")
            }
        }
    }
}
