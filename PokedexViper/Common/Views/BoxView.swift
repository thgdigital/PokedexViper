//
//  BoxView.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 04/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit
import LBTATools

class BoxView: UIView {
    var titleLabel: UILabel = {
        let labelTitle = UILabel()
         labelTitle.text = "Pokédex"
        labelTitle.font = UIFont.applicationTitle
        return labelTitle
    }()
    
    var descriptionLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont.pokemonDescription
         labelTitle.text = "Search for Pokémon by name or using the National Pokédex number"
        return labelTitle
    }()
  
    var search: IndentedTextField = {
        let searchBar = IndentedTextField(placeholder: "What Pokémon are you looking for?", padding: 20, cornerRadius: 10)
        return searchBar
    }()
    
    
    var serachImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "search"), contentMode: .scaleAspectFit)
        return image
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        xibSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func xibSetup() {
        let view = UIView(backgroundColor: UIColor.textField)
        view.layer.cornerRadius = 10
        view.hstack( UIView().withWidth(20), serachImage.withWidth(16).withHeight(16), search.withHeight(40), alignment: .center, distribution: .fillProportionally).withMargins(.init(top: 20, left: 0, bottom: 0, right: 0))
        stack(titleLabel,descriptionLabel,view.withHeight(60), spacing: 6 ).padTop(20).withMargins(.allSides(14))
    }

}
 extension UIView {
     /** Loads instance from nib with the same name. */
     func loadNib() -> UIView {
         let bundle = Bundle(for: type(of: self))
         let nibName = type(of: self).description().components(separatedBy: ".").last!
         let nib = UINib(nibName: nibName, bundle: bundle)
         return nib.instantiate(withOwner: self, options: nil).first as! UIView
     }
 }

