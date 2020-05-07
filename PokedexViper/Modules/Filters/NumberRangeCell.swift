//
//  NumberRangeCell.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 07/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit
import TTRangeSlider

class NumberRangeCell: CollectionViewCell {
    let rangeSlider = TTRangeSlider(frame: .zero)
    
    @IBOutlet weak var boxSlider: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rangeSlider.lineBorderWidth = 1
        rangeSlider.maxValue = 800
        rangeSlider.minValue = 1
        rangeSlider.maxLabelColour = .textGenerations
        rangeSlider.minLabelColour = .textColor
        rangeSlider.maxLabelFont = .pokemonNumber
        rangeSlider.minLabelFont = .pokemonNumber
        rangeSlider.handleColor = .white
        rangeSlider.handleBorderColor = .backgroundGenerationsSelected
        rangeSlider.handleBorderWidth = 1
        rangeSlider.tintColorBetweenHandles = .backgroundGenerationsSelected
        rangeSlider.labelPosition =  .below
        rangeSlider.delegate = self
        boxSlider.stack(rangeSlider).padLeft(20).padRight(20)

    }
    
   
}
extension NumberRangeCell: TTRangeSliderDelegate {
    func rangeSlider(_ sender: TTRangeSlider!, didChangeSelectedMinimumValue selectedMinimum: Float, andMaximumValue selectedMaximum: Float) {
        print("Maximo : \(Int(selectedMaximum)) e Min: \(Int(selectedMinimum))")
    }
}
