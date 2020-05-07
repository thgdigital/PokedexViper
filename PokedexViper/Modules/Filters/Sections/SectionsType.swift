//
//  SectionsType.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 07/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class SectionsType: Sections {
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        BoxFilterTypeCell.self
    }
    
    override func direction() -> UICollectionView.ScrollDirection {
         .horizontal
    }
    override func header() -> CollectionViewHeader.Type? {
        FilterHeader.self
    }

    override func willDisplayHeader(_ headerView: CollectionViewHeader) {
        if let headerView  = headerView as? FilterHeader {
            headerView.titleLabel.text = name
        }
    }
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let boxCell = cell as? BoxFilterTypeCell, let items = items as? [FiltersIcoItem] {
            boxCell.items = items
        }
    }
}
