//
//  FiltersProtocol.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol FiltersPresenterInput {
    func viewDidLoad()
}

protocol FiltersPresenterOuput: class {
    func reload(sections: [Sections])
}
protocol FiltersInteractorInput {
     func updateView()
}
protocol FiltersInteractorOuput: class {
    func fetched(entites: [FiltersEntity])
}
