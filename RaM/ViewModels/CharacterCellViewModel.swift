//
//  CharacterCellViewModel.swift
//  RaM
//
//  Created by Vlad Dzirko on 17.08.2023.
//

import UIKit

final class CharacterCellViewModel {
    
    public let characterName: String
    private let characterImage: URL?
    
    init(characterName: String, characterImage: URL?) {
        self.characterName = characterName
        self.characterImage = characterImage
    }
    
    public func fetchImage(completion: @escaping (Result<Data,Error>) -> Void) {
        guard let url = characterImage else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
}
