//
//  MovieDetialViewModel.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/12/24.
//

import SwiftUI

class MovieDetialViewModel: ObservableObject {
    
    private var movieData: MovieDetailModel?
    @Published var loadingState: LoadingState = .loading
    
    private var mockService = MockHTTPClient()
    
    required init(movieData: MovieDetailModel? = nil) {
        self.movieData = movieData
    }
    
    func getMovieDetailById(movieId: String) {
        if movieId.isEmpty {
            return
        }
        self.loadingState = .loading
        mockService.getMovieDetailById(movieId: movieId) { result in
            switch result {
            case .success(let movieData):
                DispatchQueue.main.async {
                    self.movieData = movieData
                    self.loadingState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failure
                }
            }
        }
    }
    
    var title: String {
        self.movieData?.title ?? ""
    }
    
    var year: String {
        self.movieData?.year ?? ""
    }
    
    var rated: String {
        self.movieData?.rated ?? ""
    }
    
    var plot: String {
        self.movieData?.plot ?? ""
    }
    
    var director: String {
        self.movieData?.director ?? ""
    }
    
    var writer: String {
        self.movieData?.writer ?? ""
    }
    
    var actors: String {
        self.movieData?.actors ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieData?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var poster: String {
        self.movieData?.poster ?? ""
    }
    
    var imdbId: String {
        self.movieData?.imdbId ?? ""
    }
    
    var language: String {
        self.movieData?.language ?? ""
    }
}

