//
//  Networker.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/20/22.
//

import Foundation
import UIKit.UIImage

class Networker {
    static func retrieveCredits(completion: @escaping (Result<CreditDataLevel, NetworkError>) -> Void) {
        guard let request = URLRequest.request(.credit) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.responseError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    completion(.failure(NetworkError.network(response.statusCode)))
                    print(NetworkError.network(response.statusCode).errorDescription)
                }
            } else {
                completion(.failure(NetworkError.invalidResponse))
            }

            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let creditsResponse = try? decoder.decode(CreditTopLevel.self, from: data) {
                    completion(.success(creditsResponse.data))
                } else {
                    completion(.failure(NetworkError.parseError))
                    print(NetworkError.parseError.errorDescription)
                }
            } else {
                completion(.failure(NetworkError.invalidData))
            }
            
        }.resume()
    }
}
