//
//  ContentView.swift
//  Pokedex SwiftUI
//
//  Created by Welliton da Conceicao de Araujo on 30/04/23.

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                
            }
            .onAppear {
                Pokemon().getData() { pokemon in
                    self.pokemon = pokemon
                    
                    for pokemon in pokemon {
                        print(pokemon.name)
                    }
                }
            }
            
            .searchable(text: $searchText)
            .navigationTitle("Pokedex SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
