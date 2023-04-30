//
//  Pokemon.swift
//  Pokedex SwiftUI
//
//  Created by Welliton da Conceicao de Araujo on 30/04/23.
//


//{
//  "count": 1281,
//  "next": "https://pokeapi.co/api/v2/pokemon/?offset=151&limit=151",
//  "previous": null,
//  "results": [
//    {
//      "name": "bulbasaur",
//     "url": "https://pokeapi.co/api/v2/pokemon/1/"
//   },

import Foundation

struct Pokemon: Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable {
    let id = UUID()
    var name: String
    var url: String
}

