//
//  MoviesService.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import Foundation

final class MoviesService {
    
    static let shared = MoviesService()
    
    let movieRequest = MoviesRequest()
    
    private init() {}
}
