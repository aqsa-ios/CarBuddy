//
//  NetworkRoute.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/20/22.
//

import Foundation

public enum CarMDRoute {
    case credit, decode, field, image

    var path: String {
        switch self {
        case .credit:
            return "/credits"
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
extension CarMDRoute {
    var constants: NetworkConstants {
        return NetworkConstants()
    }
    
    struct NetworkConstants {
        let baseURL = "https://api.carmd.com"
        let authorizationKey = "authorization"
        let partnerTokenKey = "partner-token"
        let authorizationToken = "Basic ZGM5NDE3NjAtYmNkZi00MDllLThkNDktMGRiYzdlMDljZTFm"
        let partnerToken = "f824614938424ded8b7ceca1c4d84abf"
        let version = "/v3.0"
    }
}
