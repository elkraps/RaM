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
    
    public func fetchCharacters() {
        ApiService.shared.makeDataRequest(.listCharacters, expecting: CharacterResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                let results = model.results
                DispatchQueue.main.async {
                    self?.characters = results
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    public func fetchEpisodes() {
        ApiService.shared.makeDataRequest(.listEpisodes, expecting: EpisodeResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                let results = model.results
                DispatchQueue.main.async {
                    self?.episodes = results
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
