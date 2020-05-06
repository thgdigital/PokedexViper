//
//  GenerationPokemonEntity.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class GenerationPokemonEntity: NSObject {
    var name: String = ""
    var url: String = ""
    
    init(model: MainRegion) {
        if model.name == "nidoran-m" {
            self.name = "nidorina"
        } else if model.name == "nidoran-f"{
            self.name = "nidoran-female"
        } else {
            self.name = model.name
        }
        self.url = model.url
    }
}
