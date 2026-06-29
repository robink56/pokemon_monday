import Foundation

nonisolated struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonTypeSlot]
    let stats: [PokemonStat]
    let sprites: PokemonSprites
}

struct PokemonTypeSlot: Codable {
    let type: PokemonType
}

struct PokemonType: Codable {
    let name: String
}

struct PokemonStat: Codable {
    let baseStat: Int
    let stat: StatInfo

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

struct StatInfo: Codable {
    let name: String
}

struct PokemonSprites: Codable {
    let other: OtherSprites
}

struct OtherSprites: Codable {
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
