//
//  GenerationWiframe.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

protocol GenerationWiframeDelegate: class {
    func result(pokemons: [GenerationPokemonEntity])
}
class GenerationWiframe {
    
    weak var delegate: GenerationWiframeDelegate?
    
    func makeScreen() -> GenerationListView {
        let interactor = GenerationInteractor(manager: PokemonManager.shared)
        let presenter = GenerationPresenter(interactor: interactor, wiframe: self)
        interactor.output = presenter
        let generationView = GenerationListView(collectionViewLayout: UICollectionViewFlowLayout())
        generationView.presenter = presenter
        presenter.output = generationView
        return generationView
    }
    
    func updateHome(pokemons: [GenerationPokemonEntity]) {
        delegate?.result(pokemons: pokemons)
    }
}
