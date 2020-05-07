//
//  ButonsCell.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 07/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class ButonsCell: CollectionViewCell {
    let resetButton: OrderButton = {
      let button =  OrderButton(title: "Reset", titleColor: UIColor.textColor)
        button.backgroundColor = UIColor.backgroundGenerations
        return button
    }()
    
    let applyButton: OrderButton = {
      let button =  OrderButton(title: "Apply", titleColor: UIColor.textColor)
        button.backgroundColor = UIColor.backgroundGenerations
        return button
    }()
    
    @IBOutlet weak var boxView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hstack(resetButton,applyButton, spacing: 8, distribution: .fillEqually).padRight(20).padLeft(20).withMargins(.init(top: 20, left: 20, bottom: 0, right: 20))
    }

}
