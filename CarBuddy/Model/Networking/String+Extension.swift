//
//  String+Extension.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/20/22.
//

import Foundation

extension String {
    static let empty = Self()
    static func errorDescription(_ error: NetworkError) -> String {
        let message: String
        switch error {
        case .invalidURL:
            message = "Invalid URL"
        case .invalidResponse:
            message = "Invalid Response"
        case .network(let statusCode):
            let statusMessage: String
            switch statusCode {
            case 400:
                statusMessage = "Bad Request – Invalid request format"
            case 401:
                statusMessage = "Unauthorized – Invalid API Key"
            case 402:
                statusMessage = "Request Failed"
            case 403:
                statusMessage = "Forbidden – You do not have access to the requested resource"
            case 404:
                statusMessage = "Not Found"
            case 409:
                statusMessage = "Conflict"
            case 429:
                statusMessage = "Too Many Requests"
            case 500, 502, 503, 504:
                statusMessage = "Internal Server Error"
            default:
                statusMessage = .empty
            }
            message = statusMessage
        case .parseError:
            message = "Parsing Error"
        case .responseError(let error):
            message = error.localizedDescription
        case .invalidData:
            message = "Invalid Data"
        }
        return message
    }
}

