//
//  MainViewModel.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import Observation

@Observable
final class ViewModel {
    
    var coordinator = MainCoordinator()
    var error: Error?
    
    private(set) var movies = [Movie]()
    
    private let service = MoviesService.shared
    
    func fetch() {
        service.movieRequest.fetchMovies { [weak self] in
            switch $0 {
            case .success(let movies):
                self?.movies = movies
            case .failure(let error):
                self?.error = error
            }
        }
    }
}
