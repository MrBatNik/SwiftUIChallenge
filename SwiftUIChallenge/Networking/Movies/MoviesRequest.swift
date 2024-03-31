//
//  MoviesRequest.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
}

final class MoviesRequest {
    
    func fetchMovies(_ completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "Movies", ofType: "json") else {
            return completion(.failure(NetworkError.invalidURL))
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let movies = try JSONDecoder().decode([Movie].self, from: data)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                completion(.success(movies))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
