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
    
}
protocol HomePresenterOutput: class {
    func result(pokemons: [HomeItem])
    func result(paginate: [HomeItem])
}

protocol HomeInteractorInput {
    var home: HomeEntity? { get set }
    func updateView()
    func paginate()
}

protocol HomeInteractorOuput: class {
    func fetched(homeEntity: HomeEntity)
    func fetched(paginate: HomeEntity)
    func finish()
}
