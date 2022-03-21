//
//  MovieResult.swift
//  FilmTableView
//
//  Created by Никита Коголенок on 17.03.22.
//

import Foundation

//struct MovieResult: Codable {
//    let search: [Search]
//    let totalResults: String
//    let response: String
//
//    enum CodingKeys: String, CodingKey {
//        case search = "Search"
//        case totalResults
//        case response = "Response"
//    }
//}
//
//struct Search: Codable {
//    let title: String
//    let year: String
//    let imdbID: String
//    let type: String
//    let poster: String
//
//    enum CodingKeys: String, CodingKey {
//        case title = "Title"
//        case year = "Year"
//        case imdbID
//        case type = "Type"
//        case poster = "Poster"
//    }
//}

struct MovieResult: Codable {
    let Search: [Movie]
}
