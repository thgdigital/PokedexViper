//
//  HomeInteractor.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInput {
    weak var output: HomeInteractorOuput?
    
   let manager: PokemonManager
    
    init(manager: PokemonManager) {
        self.manager = manager
    }
    
    func updateView() {
        
        manager.fetchHome { (result) in
            switch result {
            case .success(let home):
                self.fetchKalos(homeModel: home)
            case .failure(let error):
                dump(error)
            }
        }
    }
    
    fileprivate func fetchKalos(homeModel: HomeModel){
        manager.kalosPokemon { (result) in
            switch result {
                
            case .success(let pokemons):
                self.output?.fetched(homeEntity: HomeEntityMapper.mappingHome(model: homeModel, kalos: pokemons))
            case .failure(let error):
                dump(error)
            }
        }
    }
}
