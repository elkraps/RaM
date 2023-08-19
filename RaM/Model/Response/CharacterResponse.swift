//
//  CharacterResponse.swift
//  RaM
//
//  Created by Vlad Dzirko on 17.08.2023.
//

import Foundation

struct CharacterResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let previous: String?
    }
    
    let info: Info
    let results: [Character]
}
