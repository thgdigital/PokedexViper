//
//  HomePresenter.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterInput {
    
    var finishPagination: Bool = false
    
    var items: [HomeItem] = [HomeItem]()
    
    weak var output: HomePresenterOutput?
    
    var interactor: HomeInteractorInput
    
    var wiframe: HomeWireframe
    
    init(interactor: HomeInteractorInput, wiframe: HomeWireframe) {
        self.interactor = interactor
        self.wiframe = wiframe
    }
    
    func viewDidLoad() {
        interactor.updateView()
    }
    
    func paginate() {
        interactor.paginate()
    }
    
    func filterLoading() -> [HomeItem] {
        items = items.filter({ !($0 is HomeItemLoading) })
        return items
    }
    
    func updatePokemon(pokemos: [GenerationPokemonEntity]) {
        interactor.generation(pokemons: pokemos)
    }
    
    func didTap(by: OrderBySelected) {
        interactor.order(by: by)
    }
    
    func didTap(item: selectedHome) {
        switch item {
        case .generation:
            wiframe.showGenerations()
        case .filter:
            break
        case .order:
            wiframe.showSort()
            break
        }
    }
}

extension HomePresenter: HomeInteractorOuput {
    
    func finish() {
        finishPagination = true
    }
    
    func fetched(paginate: HomeEntity) {
        items = filterLoading()
        items.append(contentsOf: paginate.results.map({ HomeItem.mapping(pokemonModel: $0) }))
        
        if let homeCount = self.interactor.home?.count, (homeCount % items.count) != 0 {
            let appendLoading = HomeItemLoading()
            items.append(appendLoading)
        }
        output?.result(pokemons: items)
    }
    
    func fetched(generactions: HomeEntity) {
        items = generactions.results.map({ HomeItem.mapping(pokemonModel: $0) })
        output?.result(pokemons: items)
    }
    
    func fetched(homeEntity: HomeEntity) {
        items = homeEntity.results.map({ HomeItem.mapping(pokemonModel: $0) })
        items.append(HomeItemLoading())
        output?.result(pokemons: items)
    }
}
