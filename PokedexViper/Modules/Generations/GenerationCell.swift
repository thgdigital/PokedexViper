//
//  GenerationCell.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class GenerationCell: UICollectionViewCell {

    @IBOutlet weak var pokemon1Image: UIImageView!
    @IBOutlet weak var pokemon2Image: UIImageView!
    @IBOutlet weak var pokemon3Image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.backgroundGenerations
        layer.cornerRadius = 10
        nameLabel.textColor = UIColor.textGenerations
    }
    
    func populate(item: Generationitem) {
        nameLabel.text = item.name
        pokemon1Image.image = UIImage(named: item.generations[0])
        pokemon2Image.image = UIImage(named: item.generations[1])
        pokemon3Image.image = UIImage(named: item.generations[2])
    }

}
