//
//  MoviesListView.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import SwiftUI

struct MoviesListView: View {
    
    let movies: [Movie]
    
    @Environment(MainCoordinator.self) private var coordinator: MainCoordinator
    
    var body: some View {
        List(movies) { movie in
            movieCell(movie)
        }
        .navigationTitle("Movies")
    }
    
    @ViewBuilder
    private func movieCell(_ movie: Movie) -> some View {
        Button {
            coordinator.push(movie)
        } label: {
            HStack(spacing: 16) {
                // MARK: - thumbURL should be used instead of system name
                // Image View should be done as a custom image view with cache under the hood
                Image(systemName: "film.circle")
                .resizable()
                .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text(movie.title)
                    .font(.title2)
                    
                    Text(movie.genre + "•" + movie.year)
                    .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "chevron.forward.circle")
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    MoviesListView(movies: [
        .init(
            id: UUID(),
            title: "Movie 1",
            year: "2022",
            genre: "Action",
            description: "Description for Movie 1",
            thumbURL: "https://example.com/thumb1.jpg"
        )
    ])
    .environment(MainCoordinator())
}
