//
//  FiltersListView.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FiltersListView: CollectionViewController {
    
    var preenter: FiltersPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        preenter.viewDidLoad()

    }
}
extension FiltersListView: FiltersPresenterOuput {
    
    func reload(sections: [Sections]) {
        self.sections = sections
    }
}
