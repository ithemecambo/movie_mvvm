//
//  URL+extension.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import Foundation

extension URL {
    static func forMoviesByName(name: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMoviesByImdbId(imdbId: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
}
