//
//  HomeModel.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

struct HomeModel: Codable {
    let count:Int
    let next: String?
    let previous: String?
    let results: [PokemonHome]
    
    struct PokemonHome: Codable {
        let name: String
        let url: String
    }
    
}
