//
//  RickYMorty.swift
//  NuevaPruebaRick
//
//  Created by Gimabelle Garcia vasquez on 8/10/22.
//

import Foundation

struct RickYMorty : Decodable {
    let info: Info?
    let results: [ResultRickYMorty]?
    
    }
// Info
struct Info : Decodable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}
// Result
struct ResultRickYMorty : Decodable {
    let id: Int?
    let name, air_date, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?
}

