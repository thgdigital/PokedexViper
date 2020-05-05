//
//  GenerationEntity.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class GenerationEntity: NSObject {
    var name: String
    var generations: [String]
    
    init(name: String, generations: [String] ) {
        self.name = name
        self.generations = generations
    }
    
}
