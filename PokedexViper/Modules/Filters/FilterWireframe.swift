//
//  FilterWireframe.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class FilterWireframe {
 
    
    func makeScreen() -> FiltersListView {
        let interactor = FiltersInteractor()
        let presenter = FiltersPresenter(interactor: interactor, wireframe: self)
        interactor.ouput = presenter
         let layout  = UICollectionViewFlowLayout()
        let filtersView = FiltersListView(collectionViewLayout: layout)
        filtersView.preenter = presenter
        presenter.output = filtersView
        return filtersView
    }
}
