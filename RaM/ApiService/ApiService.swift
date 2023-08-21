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
    
    enum ApiError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func makeDataRequest<T: Codable>(_ request: ApiRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ApiError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ApiError.failedToGetData))
                return
            }

            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    
    private func request(from apiRequest: ApiRequest) -> URLRequest? {
        guard let url = apiRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.httpMethod
        
        return request
    }
    
    public func getEpisodesForCharacter<T: Codable>(characterURL: String?, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        if let url = characterURL {
            guard let url = URL(string: url) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                
                do {
                    let episode = try JSONDecoder().decode(type.self, from: data)
                    completion(.success(episode))
                }
                catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
    }
}
