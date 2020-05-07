//
//  FiltersPresenter.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class FiltersItem: NSObject {
    var name: String = ""
    var icos: [FiltersIcoItem] = []
    
    init(entity: FiltersEntity) {
        self.name = entity.name
        self.icos = entity.icos.map({ FiltersIcoItem(unselected: UIImage(named: $0.unselected), selected: UIImage(named: $0.selected)) })
    }
}

class FiltersEntity: NSObject {
    var name: String = ""
    var icos: [FiltersIcoEntity] = []
        
    init(name: String, icos: [FiltersIcoEntity]) {
        self.name = name
        self.icos = icos
    }
}

class FiltersIcoItem: NSObject {
    let unselected: UIImage?
    let selected: UIImage?
    init(unselected: UIImage?, selected: UIImage?) {
        self.unselected = unselected
        self.selected = selected
    }
}

class FiltersIcoEntity: NSObject {
    let unselected: String
    let selected: String
    
    init(unselected: String, selected: String) {
           self.unselected = unselected
           self.selected = selected
       }
}

class FiltersItemNumberRange: FiltersItem {
    init() {
        super.init(entity: FiltersEntity(name: "Number Range", icos: [FiltersIcoEntity(unselected: "", selected: "")]))
    }
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
        let itemDefault = FiltersItemNumberRange()
        let sectionNumberRange = SectionsNumberRange(items: [itemDefault], name: "Number Range")
        sections.append(sectionNumberRange)
        
        let sectionsNumber = SectionsButtons(items: [itemDefault], name: "")
        sections.append(sectionsNumber)
        return sections
    }
}
