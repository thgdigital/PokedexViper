//
//  HomeEntity.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class HomeEntity: NSObject {
    var count:Int = 0
    var next: String = ""
    var previous: String = ""
    var results: [PokemonHomeEntity] = []
}

class PokemonHomeEntity: NSObject {
    var idPokemon: String = ""
    var name: String = ""
    var url: String = ""
    var image: String = ""
    var type: [String] = []
}
