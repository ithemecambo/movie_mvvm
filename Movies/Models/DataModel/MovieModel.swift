//
//  MovieModel.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [MovieModel]
    let totalResults: String
    let response: String
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults
        case response = "Response"
    }
}

struct MovieModel: Codable {
    
    let title: String
    let year: String
    var imdbId: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
