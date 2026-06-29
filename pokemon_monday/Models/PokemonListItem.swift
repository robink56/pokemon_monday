//
//  PokemonListItem.swift
//  pokemon_monday
//
//  Created by rkhatri on 29.06.26.
//



import Foundation

struct PokemonListItem: Identifiable {
    let id: Int
    let name: String

    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
}
