//
//  LocationModel.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
}
