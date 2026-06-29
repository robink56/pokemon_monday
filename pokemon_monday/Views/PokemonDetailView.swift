import SwiftUI

struct PokemonDetailView: View {
    let pokemonName: String

    @State private var detail: PokemonDetail?

    var body: some View {
        VStack {
            if let detail = detail {
                Text(detail.name.capitalized)
                    .font(.largeTitle)

                Text("Weight: \(detail.weight)")
                Text("Height: \(detail.height)")

                ForEach(detail.types, id: \.type.name) { item in
                    Text(item.type.name.capitalized)
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            PokemonAPIService.shared.fetchPokemonDetail(name: pokemonName) { result in
                switch result {
                case .success(let data):
                    detail = data
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

#Preview {
    PokemonDetailView(pokemonName: "bulbasaur")
}
