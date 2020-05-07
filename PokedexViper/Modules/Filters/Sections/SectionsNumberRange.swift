//
//  SectionsNumberRange.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 07/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation
import UIKit

class SectionsNumberRange: Sections {
    
    override func header() -> CollectionViewHeader.Type? {
           FilterHeader.self
       }

       override func willDisplayHeader(_ headerView: CollectionViewHeader) {
           if let headerView  = headerView as? FilterHeader {
               headerView.titleLabel.text = name
           }
       }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        NumberRangeCell.self
    }
}
