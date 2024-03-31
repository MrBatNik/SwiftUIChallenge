//
//  Movie.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import Foundation

// MARK: - thumbURL should be decoded as URL
// thumbURL was decoded as String as task provided
struct Movie: Codable, Hashable, Identifiable {
    
    let id: UUID
    let title: String
    let year: String
    let genre: String
    let description: String
    let thumbURL: String
}
