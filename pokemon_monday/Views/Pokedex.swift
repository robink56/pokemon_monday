import SwiftUI

struct PokedexView: View {
    @State private var searchText = ""
    //for all
    //@State private var pokemons: [PokemonResult] = []

    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
        
    let pokemons = [
        PokemonListItem(id: 1, name: "Bulbasaur"),
        PokemonListItem(id: 2, name: "Ivysaur"),
        PokemonListItem(id: 3, name: "Venusaur"),
        PokemonListItem(id: 4, name: "Charmander"),
        PokemonListItem(id: 5, name: "Charmeleon"),
        PokemonListItem(id: 6, name: "Charizard")
    ] 
    var body: some View {
        NavigationView {
            ScrollView {
                Text("\(pokemons.count) Pokémon")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(pokemons) { pokemon in
                        NavigationLink {
                            PokemonDetailView(pokemonName: pokemon.name)
                            Text("\(pokemon.name) Detail View")
                        } label: {
                            VStack {
                                AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 90, height: 90)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 90, height: 90)
                                }
                                
                                Text(pokemon.name.capitalized)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(radius: 3)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle("Pokédex")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always))
            
      
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {   //top-right
                    Button("Sort") {
                        print("Sor")
                    }
                }
            }
            // forAll
            /*.onAppear {
                fetchPokemonList { result in
                    switch result {
                    case .success(let data):
                        pokemons = data

                    case .failure(let error):
                        print(error)
                    }
                }
            } */
            
            
            
        }
       
         
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
}

#Preview {
    PokedexView()
}
