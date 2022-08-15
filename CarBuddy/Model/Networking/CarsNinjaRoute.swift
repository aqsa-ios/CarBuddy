//
//  CarsNinjaRoute.swift
//  CarBuddy
//
//  Created by Aqsa on 8/14/22.
//

import Foundation

public enum CarsNinjaRoute {
    case cars, decode, field, image

    var path: String {
        switch self {
        case .cars:
            return "/cars"
        case .decode:
            return "/decode"
        case .field:
            return "/fields"
        case .image:
            return "/image"
        }
    }

    func url(_ queryItems: [URLQueryItem] = []) -> URL? {
        guard let url = URL(
            string: constants.baseURL
        )?.appendingPathComponent(constants.version).appendingPathComponent(path)
        else { return nil }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = queryItems
        return components?.url
    }
}

// Constants
extension CarsNinjaRoute {
    var constants: NetworkConstants {
        return NetworkConstants()
    }
    
    struct NetworkConstants {
        let baseURL = "https://api.api-ninjas.com"
        let authorizationKey = "X-Api-Key"
        let authorizationToken = "HBX6fqyDlHvIMv0jy5VKGA==QLadOuhZR7iRlcTa"
        let version = "/v1"
    }
}

struct CarDetailsReponse: Codable {
    let cityMpg: Int?
    let `class`: String?
    let combinationMpg: Int?
    let cylinders: Int?
    let displacement: Double?
    let drive: String?
    let fuelType: String?
    let highwayMpg: Int?
    let make: String?
    let model: String?
    let transmission: String?
    let year: Int?
}

struct CarDetailsTopLevel: Codable {
    let carDetails: [CarDetailsReponse]
}
