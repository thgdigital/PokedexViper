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
    var wiframe: GenerationWiframe
    
    init(interactor: GenerationInteractorInput,wiframe: GenerationWiframe) {
        self.interactor = interactor
        self.wiframe = wiframe
    }
    
    func viewdLoad() {
        interactor.updateView()
    }
    
    func didSelected(index: Int) {
        interactor.didSelected(index: (index + 1))
      print("Geração selecionada: \(index + 1)")
    }
}
extension GenerationPresenter: GenerationInteractorOuput {
    
    func result(generations: [GenerationPokemonEntity]) {
        wiframe.updateHome(pokemons: generations)
    }

    func fetched(entities: [GenerationEntity]) {
        output?.result(items: entities.map({ Generationitem(name: $0.name, generations: $0.generations)}))
    }
}
