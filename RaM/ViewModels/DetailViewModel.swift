//
//  DetailViewModel.swift
//  RaM
//
//  Created by Vlad Dzirko on 19.08.2023.
//

import UIKit

final class DetailViewModel {
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    public var title: String {
        character.name
    }
}
