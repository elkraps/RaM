//
//  CharacterDetailViewModel.swift
//  RaM
//
//  Created by Vlad Dzirko on 20.08.2023.
//

import Foundation
import SwiftUI

final class CharacterDetailViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var episodes: [Episode] = []
    
//    public func fetchCharacters() {
//        ApiService.shared.makeDataRequest(.listCharacters, expecting: CharacterResponse.self) { [weak self] result in
//            switch result {
//            case .success(let model):
//                let results = model.results
//                DispatchQueue.main.async {
//                    self?.characters = results
//                }
//            case .failure(let error):
//                print(String(describing: error))
//            }
//        }
//    }
    
    public func fetchEpisodeForOneCharacter(character: Character) {
        for url in character.episode {
            
            ApiService.shared.getEpisodesForCharacter(characterURL: url, expecting: Episode.self) { [weak self] data in
                switch data {
                case .success(let model):
                    DispatchQueue.main.async {
                        self?.episodes.append(model)
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        }
    }
}
