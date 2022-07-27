//
//  Car.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/19/22.
//

import UIKit

struct CarUpload: Codable {
    let vin: String?
    let make: String?
    let model: String?
    let year: String?
}

struct Message: Codable {
    let code: Int
    let message: String
    let credentials: String
    let version: String
    let endpoint: String
    let counter: Int
}

struct FieldTopLevel: Codable {
    let message: Message
    let data: [String: Bool]
}

struct FieldDataLevel: Codable {
    
}

struct ImageTopLevel: Codable {
    let message: Message
    let data: [String: String]
}

struct ImageDataLevel: Codable {
    
}

struct CreditTopLevel: Codable {
    let message: Message
    let data: CreditDataLevel
}

struct CreditDataLevel: Codable {
    var credits: Int
}
