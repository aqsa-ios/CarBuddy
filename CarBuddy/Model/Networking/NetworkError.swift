//
//  NetworkError.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/20/22.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case responseError(_ error: Error)
    case network(_ statusCode: Int)
    case parseError
    
    var errorDescription: String {
        return .errorDescription(self)
    }
}
