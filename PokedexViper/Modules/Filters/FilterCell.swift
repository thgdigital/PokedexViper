//
//  FilterCell.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 07/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class FilterCell: CollectionViewCell {
    var item: FiltersIcoItem!
    
    override var isSelected: Bool {
        didSet {
            iconImageView.image = isSelected ? item.selected: item.unselected
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            iconImageView.image = isHighlighted ? item.selected: item.unselected
        }
    }
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(icos: FiltersIcoItem) {
        self.item = icos
        iconImageView.image = icos.unselected
    }
}
