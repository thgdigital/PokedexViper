//
//  FiltersPresenter.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

struct FiltersItem {
    let name: String
    let icos: [FiltersIcoItem]
}

struct FiltersEntity {
    let name: String
    let icos: [FiltersIcoEntity]
}

struct FiltersIcoItem {
    let unselected: UIImage?
    let selected: UIImage?
}

struct FiltersIcoEntity {
    let unselected: String
    let selected: String
}

class FiltersPresenter: FiltersPresenterInput {
    
    let interactor: FiltersInteractorInput
    let wireframe: FilterWireframe
    
    init(interactor: FiltersInteractorInput, wireframe: FilterWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        interactor.updateView()
    }
}
extension FiltersPresenter: FiltersInteractorOuput {
    
    func fetched(entites: [FiltersEntity]) {
       
    }
    
}
