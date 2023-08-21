//
//  EpisodeResponse.swift
//  RaM
//
//  Created by Vlad Dzirko on 20.08.2023.
//

import Foundation

struct EpisodeResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let previous: String?
    }
    
    let info: Info
    let results: [Episode]
}
