//
//  MovieViewModel.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import SwiftUI

class MovieListViewModel: ViewModelBase {
    @Published var movies = [MovieViewModel]()
    private var mockService = MockHTTPClient()
    
    func searchByName(name: String) {
        if name.isEmpty {
            return
        }
        self.loadingState = .loading
        mockService.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                        self.loadingState = .success
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.loadingState = .failure
                }
            }
        }
    }
}

struct MovieViewModel {
    
    let movie: MovieModel
    
    var title: String {
        movie.title
    }
    
    var year: String {
        movie.year
    }
    
    var imdbID: String {
        movie.imdbId
    }
    
    var type: String {
        movie.type
    }
    
    var poster: String {
        movie.poster
    }
}
