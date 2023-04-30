//
//  PokemonListView.swift
//  Pokedex SwiftUI
//
//  Created by Welliton da Conceicao de Araujo on 30/04/23.
//

import SwiftUI

struct PokemonListView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter( {
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack {
                        PokemonImageView(imageLink: "\(entry.url)") // Pokemon Image
                            .padding(.trailing, 10)
                        NavigationLink("\(entry.name)".capitalized, destination: Text("\(entry.name)"))
                            .font(.system(size: 23))
    
                    }
                }
            }
            .onAppear {
                PokeApi().getData() {pokemon in
                    self.pokemon = pokemon
                }
            }
            
            .searchable(text:$searchText, prompt: "Buscar Pokemon")
            .navigationTitle("Pokedex SwiftUI")
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
