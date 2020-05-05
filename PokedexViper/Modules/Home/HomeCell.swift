//
//  HomeCell.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 04/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var typeFist: UIImageView!
    @IBOutlet weak var lastType: UIImageView!
    @IBOutlet weak var pokemomImage: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var namaLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        numberLabel.text = "#001"
        numberLabel.textColor = UIColor.textColor
        numberLabel.font = UIFont.pokemonNumber
        namaLabel.font = UIFont.pokemonName
        namaLabel.text = "Bulbasaur"
        namaLabel.textColor = .white
        boxView.backgroundColor = UIColor.grassTypeBackground
        boxView.layer.cornerRadius = 10
        self.shadowHome()
    }
}
