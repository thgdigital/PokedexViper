//
//  HomeItem.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation
import UIKit

class HomeItem: NSObject {
    var background: UIColor = .white
    var idPokemon: String = ""
    var name: String = ""
    var url: String = ""
    var image: String = ""
    var type: [String] = []
    
    static func mapping(pokemonModel: PokemonHomeEntity) -> HomeItem {
        let item = HomeItem()
        item.idPokemon = pokemonModel.idPokemon
        item.image = pokemonModel.image
        item.name = pokemonModel.name.capitalized
        item.url = pokemonModel.url
        item.type = pokemonModel.type
        if let fistType = item.type.first {
            item.background = mappingBackground(type: fistType)
        }
        return item
    }
    
    static func mappingBackground(type: String) -> UIColor {
        guard let colorString =  ColorString(rawValue: type) else {
            return .white
        }
        return UIColor.backgroundColor(colorString: colorString)
    }
    
    
}
class HomeItemLoading: HomeItem {
    
}
