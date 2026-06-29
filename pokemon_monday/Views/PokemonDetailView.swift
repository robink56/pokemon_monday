import SwiftUI

struct PokemonDetailView: View {
    let pokemonName: String

    @State private var detail: PokemonDetail?

    var body: some View {
        VStack {
            if let detail = detail {
                Text(detail.name.capitalized)
                    .font(.largeTitle)
                
                if let imageUrl = detail.sprites.other.officialArtwork.frontDefault {
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                
            HStack {
                ForEach(detail.types, id: \.type.name) { item in
                    Text(item.type.name.capitalized)
                }
                    
                }
               

                Text("Weight: \(detail.weight) kg" )
                Text("Height: \(detail.height) inch")

                
                
                Divider()
                
                Text("Base Stats")
                    .font(.title2)
                    .bold()
                
                ForEach(detail.stats, id: \.stat.name) { stat in
                    HStack {
                        Text(stat.stat.name.capitalized)
                        Spacer()
                        Text("\(stat.baseStat)")
                           
                    }
                    .padding(.horizontal, 20)
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
        
        //for all
        
        /*.onAppear {
            FetchPokemonList.shared.fetchPokemonList { result in
                switch result {
                case .success(let data):
                    pokemons = data

                case .failure(let error):
                    print(error)
                }
            }
        } */
        
        
        
        
    }
}

#Preview {
    PokemonDetailView(pokemonName: "bulbasaur")
}
