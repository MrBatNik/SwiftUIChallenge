//
//  MovieDetailsView.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movie: Movie
    
    @Environment(MainCoordinator.self) private var coordinator: MainCoordinator<Movie>
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                title()
                
                section("About") {
                    Text(movie.title)
                    .font(.title2)
                    
                    Text(movie.genre)
                    .font(.subheadline)
                    .padding(.bottom, 8)
                    
                    Text(movie.description)
                    .font(.callout)
                }
                
                section("Information", spacing: 16) {
                    Text("Released\n\(movie.year)")
                    
                    Text("Genre\n\(movie.genre)")
                    
                }
                .font(.caption)
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    coordinator.pop()
                } label: {
                    Image(systemName: "chevron.backward.circle")
                }
                .foregroundStyle(.black)
            }
        }
    }
    
    @ViewBuilder
    private func title() -> some View {
        ZStack(alignment: .bottom) {
            // MARK: - This image should come with a Movie and should be different from thumbURL
            // Image should be provided with a better resolution
            // Image View should be done as a custom image view with cash under the hood
            Image(systemName: "movieclapper")
            .resizable()
            .foregroundStyle(.gray)
            
            VStack {
                Text(movie.title)
                .font(.title)
                
                Text(movie.genre + " • " + movie.year)
                .font(.subheadline)
            }
            .padding(.bottom, 32)
        }
        .frame(height: 300)
    }
    
    @ViewBuilder
    private func section<C: View>(_ title: String, spacing: CGFloat = 0, @ViewBuilder content: () -> C) -> some View {
        VStack(alignment: .leading) {
            Text(title)
            .font(.title2)
            .bold()
            
            VStack(alignment: .leading, spacing: spacing) {
                content()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray.tertiary)
            )
        }
    }
}

#Preview {
    MovieDetailsView(movie: .init(
        id: UUID(),
        title: "Movie 1",
        year: "2022",
        genre: "Action",
        description: "Description for Movie 1",
        thumbURL: "https://example.com/thumb1.jpg"
    ))
    .environment(MainCoordinator<Movie>())
}
