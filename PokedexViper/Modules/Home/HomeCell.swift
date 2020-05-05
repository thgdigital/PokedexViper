//
//  HomeCell.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 04/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit
import SDWebImage

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
    
    func populate(item: HomeItem) {
        namaLabel.text = item.name
        numberLabel.text = "#\(item.idPokemon)"
        pokemomImage.sd_setImage(with: URL(string: item.image), completed: nil)
        boxView.backgroundColor = item.background
        
        if item.type.count == 2 {
            guard let fistName = item.type.first, let lastName = item.type.last else {
                return
            }
            typeFist.image = UIImage(named: fistName.capitalized)
            typeFist.isHidden = false
            lastType.isHidden = false
            lastType.image = UIImage(named: lastName.capitalized)
            
        } else if item.type.count == 1{
            typeFist.isHidden = false
            typeFist.image = UIImage(named: item.type[0].capitalized)
            lastType.isHidden = true
        }
    }
}
