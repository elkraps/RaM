//
//  CharacterModel.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: CurrentLocation
    let image: String
    let episode: [String]
    let url: String
    let created: Date
}

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct CurrentLocation: Codable {
    let name: String
    let url: String
}
