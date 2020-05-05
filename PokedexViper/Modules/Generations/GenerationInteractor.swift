//
//  GenerationInteractor.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class GenerationInteractor: GenerationInteractorInput {
    weak var output: GenerationInteractorOuput?
    
    func updateView() {
        let generations = [
            GenerationEntity(name: "Generation I", generations: ["001", "004", "007"]),
            GenerationEntity(name: "Generation II", generations: ["152", "155", "158"]),
            GenerationEntity(name: "Generation III", generations: ["252", "255", "258"]),
            GenerationEntity(name: "Generation IV", generations: ["387", "390", "393"]),
            GenerationEntity(name: "Generation V", generations: ["495", "498", "501"]),
            GenerationEntity(name: "Generation VI", generations: ["650", "653", "656"]),
            GenerationEntity(name: "Generation VII", generations: ["722", "725", "728"]),
            GenerationEntity(name: "Generation VIII", generations: ["810", "813", "816"]),
        ]
        output?.fetched(entities: generations)
    }
}
