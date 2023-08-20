//
//  ApiRequest.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import Foundation

final class ApiRequest {
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endPoint: Endpoint
    
    private let pathComponents: [String]
    
    private let queryItems: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach { string += "\($0)"}
        }
        
        if !queryItems.isEmpty {
            string += "?"
            let argString = queryItems.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            
            string += argString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(endPoint: Endpoint, pathComponents: [String] = [], queryItems: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryItems = queryItems
    }
}

extension ApiRequest {
    static let listCharacters = ApiRequest(endPoint: .character)
    static let listEpisodes = ApiRequest(endPoint: .episode)
}
