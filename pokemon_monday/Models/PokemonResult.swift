//
//  PokemonListResponse.swift
//  pokemon_monday
//
//  Created by rkhatri on 29.06.26.
//

//for all

import Foundation

nonisolated struct PokemonListResponse: Codable {
    let results: [PokemonResult]
}

struct PokemonResult: Codable, Identifiable {
    let name: String
    let url: String

    var id: Int {
        let parts = url.split(separator: "/")
        return Int(parts.last ?? "0") ?? 0
    }

    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
}
