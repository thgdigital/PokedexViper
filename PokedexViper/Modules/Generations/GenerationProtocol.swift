//
//  GenerationProtocol.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol GenerationPresenterInput {
    func viewdLoad()
}
protocol GenerationPresenterOutput: class {
    func result(items: [Generationitem])
}
protocol GenerationInteractorInput {
    func updateView()
}

protocol GenerationInteractorOuput: class {
    func fetched(entities: [GenerationEntity])
}
