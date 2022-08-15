//
//  URLRequest+Extension.swift
//  CarBuddy
//
//  Created by Aqsa Khan on 7/25/22.
//

import Foundation


public extension URLComponents {
    init(scheme: String, host: String, path: String, queryItems: [URLQueryItem] = []) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        self = components
    }
}

public extension URLRequest {
    static func request(_ route: CarMDRoute) -> Self? {
        guard let url = route.url() else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(route.constants.authorizationToken, forHTTPHeaderField: route.constants.authorizationKey)
        request.addValue(route.constants.partnerToken, forHTTPHeaderField: route.constants.partnerTokenKey)
        
        return request
    }
    
    static func request(_ route: CarsNinjaRoute, queryItems: [URLQueryItem] = []) -> Self? {
        guard let url = route.url(queryItems) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(route.constants.authorizationToken, forHTTPHeaderField: route.constants.authorizationKey)
        
        return request
    }
}
