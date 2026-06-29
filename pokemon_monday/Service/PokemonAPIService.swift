//
//  PokemonAPIService.swift
//  pokemon_monday
//
//  Created by rkhatri on 29.06.26.
//

import Foundation
import Alamofire

class PokemonAPIService {
    static let shared = PokemonAPIService()

    private init() {}

    func fetchPokemonDetail(
        name: String,
        completion: @escaping (Result<PokemonDetail, AFError>) -> Void
    ) {
        let url = "https://pokeapi.co/api/v2/pokemon/\(name.lowercased())"

        AF.request(url)
            .validate()
            .responseDecodable(of: PokemonDetail.self) { response in
                completion(response.result)
            }
    }
}
