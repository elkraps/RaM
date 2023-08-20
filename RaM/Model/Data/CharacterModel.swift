//
//  CharacterModel.swift
//  RaM
//
//  Created by Vlad Dzirko on 16.08.2023.
//

import Foundation
import SwiftUI

struct Character: Codable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: Species
    let type: String
    let gender: Gender
    let origin: Origin
    let location: CurrentLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
    
    var color: Color {
        switch self {
        case .alive:
            return Color(Resources.Colors.greenFontColor)
        case .dead:
            return Color.red
        case .unknown:
            return Color.gray
        }
    }
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct CurrentLocation: Codable {
    let name: String
    let url: String
}
