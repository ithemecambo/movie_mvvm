//
//  MovieListScreen.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import SwiftUI

struct MovieListScreen: View {
    @ObservedObject var viewModel: MovieListViewModel
    @State private var movieName: String = ""
    
    init() {
        viewModel = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName, onEditingChanged: { _ in}, onCommit: {
                viewModel.searchByName(name: movieName)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            Spacer()
                .navigationBarTitle("Movies")
            if viewModel.loadingState == .loading {
                LoadingView()
            } else if viewModel.loadingState == .success {
                MovieListView(movies: viewModel.movies)
            } else if viewModel.loadingState == .failure {
                FailureView()
                Spacer()
            }
        }
        .embedNavigationView()
    }
}

#Preview {
    MovieListScreen()
}
