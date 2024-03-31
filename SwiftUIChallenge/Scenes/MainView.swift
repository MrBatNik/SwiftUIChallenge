//
//  MainView.swift
//  SwiftUIChallenge
//
//  Created by Nikita Batrakov on 31.03.2024.
//

import SwiftUI

struct MainView: View {
    
    @Bindable private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            Group {
                if viewModel.movies.isEmpty {
                    Placeholder()
                } else {
                    MoviesListView(movies: viewModel.movies)
                }
            }
            .onAppear(perform: viewModel.fetch)
            .progress(isPresented: viewModel.movies.isEmpty && viewModel.error == nil)
            .alert(error: $viewModel.error, action: viewModel.fetch)
            .navigationDestination(for: Movie.self) {
                MovieDetailsView(movie: $0)
            }
        }
        .environment(viewModel.coordinator)
    }
}

#Preview {
    MainView()
}
