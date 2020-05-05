//
//  HomeProtocol.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation


protocol HomePresenterInput {
    func viewDidLoad()
}
protocol HomePresenterOutput: class {
    func result(pokemons: [HomeItem])
}

protocol HomeInteractorInput {
    func updateView()
}

protocol HomeInteractorOuput: class {
    func fetched(homeEntity: HomeEntity)
}
