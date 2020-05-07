//
//  FiltersPresenter.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

struct FiltersItem {
    var name: String = ""
    var icos: [FiltersIcoItem] = []
    
    init(entity: FiltersEntity) {
        self.name = entity.name
        self.icos = entity.icos.map({ FiltersIcoItem(unselected: UIImage(named: $0.unselected), selected: UIImage(named: $0.selected)) })
    }
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
    weak var output: FiltersPresenterOuput?
    
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
        let items = entites.map({ FiltersItem(entity: $0) })
        let sections = FiltersMapperSections.mapping(items: items)
        output?.reload(sections: sections)
    }
}

class FiltersMapperSections {
    
    static func mapping(items: [FiltersItem])-> [Sections] {
        var sections = [Sections]()
        
        sections = items.map({ SectionsType(items: $0.icos, name: $0.name )})
        
        return sections
    }
}
