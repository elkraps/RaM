//
//  ApiService.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import Foundation

final class ApiService {
    static let shared = ApiService()
    
    private init() {}
    
    public func makeDataRequest(_ request: ApiRequest, completion: @escaping () -> Void) {
        
    }
}
