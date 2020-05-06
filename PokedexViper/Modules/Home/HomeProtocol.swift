//
//  HomeProtocol.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation


enum selectedHome {
    case generation
    case filter
    case order
}
protocol HomePresenterInput {
    var finishPagination: Bool { get set }
    func viewDidLoad()
    func paginate()
    func didTap(item: selectedHome)
    func updatePokemon(pokemos: [GenerationPokemonEntity])
    func didTap(by: OrderBySelected)
    
}
protocol HomePresenterOutput: class {
    func result(pokemons: [HomeItem])
    func result(paginate: [HomeItem])
    func result(generactions: [HomeItem])
}

protocol HomeInteractorInput {
    var home: HomeEntity? { get set }
    func updateView()
    func paginate()
    func generation(pokemons: [GenerationPokemonEntity])
    func order(by: OrderBySelected)
}

protocol HomeInteractorOuput: class {
    func fetched(homeEntity: HomeEntity)
    func fetched(paginate: HomeEntity)
    func fetched(generactions: HomeEntity)
    func finish()
}
