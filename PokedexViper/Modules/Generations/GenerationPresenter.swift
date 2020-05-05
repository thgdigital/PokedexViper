//
//  GenerationPresenter.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class GenerationPresenter: GenerationPresenterInput {
    var interactor: GenerationInteractorInput
    weak var output: GenerationPresenterOutput?
    
    init(interactor: GenerationInteractorInput) {
        self.interactor = interactor
    }
    func viewdLoad() {
        interactor.updateView()
    }
}
extension GenerationPresenter: GenerationInteractorOuput {
    
    func fetched(entities: [GenerationEntity]) {
        output?.result(items: entities.map({ Generationitem(name: $0.name, generations: $0.generations)}))
    }
}
