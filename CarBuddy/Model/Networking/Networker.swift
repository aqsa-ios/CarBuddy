//
//  Networker.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/20/22.
//

import Foundation
import Alamofire
import AlamofireImage

class Networker {
    static func retrieveCarDetails(_ car: Car, completion: @escaping (Result<[CarDetailsReponse], NetworkError>) -> Void) {
        
        let items = [
            URLQueryItem(name: "limit", value: "10"),
            URLQueryItem(name: "model", value: car.model),
            URLQueryItem(name: "make", value: car.make)
            ]
            
        guard let request = URLRequest.request(.cars, queryItems: items) else {
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
                if let carDetailsReponse = try? decoder.decode([CarDetailsReponse].self, from: data) {
                    completion(.success(carDetailsReponse))
                } else {
                    completion(.failure(NetworkError.parseError))
                }
            } else {
                completion(.failure(NetworkError.invalidData))
            }
            
        }.resume()
    }
}
