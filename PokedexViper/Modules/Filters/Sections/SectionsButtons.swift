//
//  SectionsButtons.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 07/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class SectionsButtons: Sections {
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        ButonsCell.self
    }
}
