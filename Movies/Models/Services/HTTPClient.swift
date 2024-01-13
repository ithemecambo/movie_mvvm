//
//  HTTPClient.swift
//  Movies
//
//  Created by SENGHORT KHEANG on 1/11/24.
//

import Foundation

enum NetworkError: Error {
    case baseURL
    case noData
    case decodingError
}

protocol HTTPClient {
    func getMoviesBy(search: String, completed: @escaping (Result<[MovieModel]?, NetworkError>) -> ())
    func getMovieDetailById(movieId: String, completed: @escaping (Result<MovieDetailModel?, NetworkError>) -> ())
}

class MockHTTPClient: HTTPClient {
    func getMoviesBy(search: String, completed: @escaping (Result<[MovieModel]?, NetworkError>) -> ()) {
        guard let url = URL.forMoviesByName(name: search) else {
            completed(.failure(.baseURL))
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {
                completed(.failure(.noData))
                return
            }
            do {
                let movieObj = try JSONDecoder().decode(MovieResponse.self, from: data)
                completed(.success(movieObj.movies))
            } catch {
                completed(.failure(.decodingError))
            }
        }
        .resume()
    }
    
    func getMovieDetailById(movieId: String, completed: @escaping (Result<MovieDetailModel?, NetworkError>) -> ()) {
        guard let url = URL.forMoviesByImdbId(imdbId: movieId) else {
            completed(.failure(.baseURL))
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {
                completed(.failure(.noData))
                return
            }
            do {
                let movieObj = try JSONDecoder().decode(MovieDetailModel.self, from: data)
                completed(.success(movieObj))
            } catch {
                completed(.failure(.decodingError))
            }
        }
        .resume()
    }
    
}
