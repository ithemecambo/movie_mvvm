//
//  MovieDetailModel.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/12/24.
//

import Foundation

struct MovieDetailModel: Codable {
    let title: String
    let year: String
    let rated: String
    let plot: String
    let director: String
    let writer: String
    let actors: String
    let imdbRating: String
    let poster: String
    let imdbId: String
    let language: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case imdbRating
        case poster = "Poster"
        case imdbId = "imdbID"
        case language = "Language"
    }
}
