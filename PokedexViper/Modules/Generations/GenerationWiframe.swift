//
//  GenerationWiframe.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit


class GenerationWiframe {
    
    func makeScreen() -> GenerationListView {
        let interactor = GenerationInteractor()
        let presenter = GenerationPresenter(interactor: interactor)
        interactor.output = presenter
        let generationView = GenerationListView(collectionViewLayout: UICollectionViewFlowLayout())
        generationView.presenter = presenter
        presenter.output = generationView
        return generationView
    }
}
