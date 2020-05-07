//
//  FilterHeader.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 07/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class FilterHeader: CollectionViewHeader {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.filterTitle
    }
    
}
