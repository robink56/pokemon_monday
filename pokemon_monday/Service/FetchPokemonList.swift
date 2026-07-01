//
//  FetchPokemonList.swift
//  pokemon_monday
//
//  Created by rkhatri on 29.06.26.
//

import Foundation
import Alamofire

func fetchPokemonList(
    completion: @escaping (Result<[PokemonResult], AFError>) -> Void
) {
    let url = "https://pokeapi.co/api/v2/pokemon?limit=150"

    AF.request(url)
        .validate()
        .responseDecodable(of: PokemonListResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data.results))

            case .failure(let error):
                completion(.failure(error))
            }
        }
}
