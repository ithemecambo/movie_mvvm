//
//  MovieDetailScreen.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/12/24.
//

import SwiftUI

struct MovieDetailScreen: View {
    let movieId: String
    @ObservedObject var viewModel = MovieDetialViewModel()
    
    var body: some View {
        VStack {
            if viewModel.loadingState == .loading {
                LoadingView()
            } else if viewModel.loadingState == .success {
                MovieDetailView(viewModel: viewModel)
            } else if viewModel.loadingState == .failure {
                FailureView()
            }
        }
        .onAppear {
            viewModel.getMovieDetailById(movieId: self.movieId)
        }
    }
}

