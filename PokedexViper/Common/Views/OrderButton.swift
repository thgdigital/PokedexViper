//
//  OrderButton.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class OrderButton: UIButton {

    override var isHighlighted: Bool {
        didSet{
            backgroundColor = isHighlighted ? UIColor.backgroundGenerationsSelected: UIColor.backgroundGenerations
            titleLabel?.textColor = isHighlighted ? .white : UIColor.textGenerations
            titleLabel?.alpha = 1
        }
    }
    override var isSelected: Bool {
        didSet{
            backgroundColor = isSelected ? UIColor.backgroundGenerationsSelected: UIColor.backgroundGenerations
            titleLabel?.textColor = isSelected ? .white : UIColor.textGenerations
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        backgroundColor = .red
        setTitleColor(.white, for: .selected)
        setTitleColor(.white, for: .highlighted)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
