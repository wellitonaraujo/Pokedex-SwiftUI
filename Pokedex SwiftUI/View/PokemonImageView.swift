//
//  PokemonImage.swift
//  Pokedex SwiftUI
//
//  Created by Welliton da Conceicao de Araujo on 30/04/23.
//

import SwiftUI

struct PokemonImageView: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 80, height: 80)
            .onAppear {
                let loadData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                    
                    print("Passou aqui")
                } else {
                    getSprite(url: loadData!)
                    print("Passou aqui")
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        
        PokemonSelectedApi().getData(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImageView()
    }
}
