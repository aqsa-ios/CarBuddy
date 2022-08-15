//
//  AppDelegate.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/19/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        readCarsFromCSV()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func readCarsFromCSV() {
        guard !UserDefaults.standard.bool(forKey: .carsImported),
            let csvPath = Bundle.main.path(forResource: "cars", ofType: "csv")
        else { return }
        do {
            let csvData = try String(contentsOfFile: csvPath)
            let csv = csvData.split(whereSeparator: \.isNewline).map { String($0) }
            for row in csv {
                let content = row.split(separator: ",").map { String($0) }
                let car = Car(make: content[0],
                                 model: content[1],
                                 year: content[2],
                                 imageURL: content[3]
                )
            }
        } catch {
            print(error)
        }
        UserDefaults.standard.set(true, forKey: .carsImported)
        CoreDataStack.saveContext()
    }

    private lazy var fetchRequest: NSFetchRequest<Car> = {
      let request = NSFetchRequest<Car>(entityName: "Car")
      request.predicate = NSPredicate(value: true)
      return request
    }()

    func fetchCars() -> [Car] {
        let cars = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        return cars
    }
}

