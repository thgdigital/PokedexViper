//
//  HomePresenter.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterInput {
    weak var output: HomePresenterOutput?
    
    var interactor: HomeInteractorInput
    
    init(interactor: HomeInteractorInput) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.updateView()
    }
}
extension HomePresenter: HomeInteractorOuput {
    
    func fetched(homeEntity: HomeEntity) {
        let items = homeEntity.results.map({ HomeItem.mapping(pokemonModel: $0) })
        output?.result(pokemons: items)
    }
}
