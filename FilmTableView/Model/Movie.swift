//
//  Movie.swift
//  FilmTableView
//
//  Created by Никита Коголенок on 17.03.22.
//

import Foundation

//struct Movie {
//    let title: String
//    let year: String
//    let imdbID: String
//    let type: String
//    let poster: String
//
//    init(currentMovie: Search) {
//        title = currentMovie.title
//        year = currentMovie.year
//        imdbID = currentMovie.imdbID
//        type = currentMovie.type
//        poster = currentMovie.poster
//    }
//}

struct Movie: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String

    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type", Poster
    }
}
