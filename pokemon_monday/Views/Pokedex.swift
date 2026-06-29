import SwiftUI

struct PokedexView: View {
    @State private var searchText = ""
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    let pokemons = ["Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("\(pokemons.count) Pokémon")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(pokemons, id: \.self) { pokemon in
                        NavigationLink {
                            PokemonDetailView(pokemonName: pokemon)
                            Text("\(pokemon) Detail View")
                        } label: {
                            VStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 90, height: 90)
                                    .overlay(
                                        Text("Image")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    )
                                
                                Text(pokemon)
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
        }
       
         
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
}

#Preview {
    PokedexView()
}
