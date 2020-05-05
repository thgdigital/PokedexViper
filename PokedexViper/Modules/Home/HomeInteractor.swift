//
//  HomeInteractor.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInput {
    
    var home: HomeEntity?
    var kalos: Kalos?
    
    weak var output: HomeInteractorOuput?
    
    var shoudPagination: Bool = true
    
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
                self.kalos = pokemons
                let home = HomeEntityMapper.mappingHome(model: homeModel, kalos: pokemons)
                self.output?.fetched(homeEntity:home )
                self.home = home
            case .failure(let error):
                dump(error)
            }
        }
    }
    
    func paginate() {
        guard let nextPage = home?.next, !nextPage.isEmpty else {
            output?.finish()
            return
        }
        
        guard let urlString  = URL(string: nextPage) else {
            return
        }
        
        if let components = URLComponents(url: urlString, resolvingAgainstBaseURL: false) , shoudPagination {
            if let queryItems = components.queryItems {
                let offset = getParamanter(queryItems:queryItems, name: "offset")
                let limit = getParamanter(queryItems:queryItems, name: "limit")
                shoudPagination = false
                manager.paginate(offset: offset, limit: limit) { (result) in
                    self.shoudPagination = true
                    switch result{
                    case .success(let homeModel):
                        let home = HomeEntityMapper.mappingHome(model: homeModel, kalos: self.kalos ?? [])
                        self.home = home
                                            self.output?.fetched(paginate: home)
                    case .failure(let error):
                        dump(error)
                        //                        self.output?.fetchError(width: error)
                    }
                }
            }
        }
    }
    
    func getParamanter(queryItems: [URLQueryItem], name: String) -> String {
        guard let queryItem = queryItems.filter({ $0.name.lowercased() == name }).first?.value else {
            return ""
        }
        return queryItem
    }
    
}

