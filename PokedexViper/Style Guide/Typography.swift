//
//  Typography.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 03/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit


extension UIFont {
    static var title: UIFont = boldSystemFont(ofSize: 100)
    static var applicationTitle: UIFont = boldSystemFont(ofSize: 32)
    static var pokemonName: UIFont = boldSystemFont(ofSize: 26)
    static var filterTitle: UIFont = boldSystemFont(ofSize: 16)
    static var pokemonDescription: UIFont = systemFont(ofSize: 16)
    static var pokemonNumber: UIFont = boldSystemFont(ofSize: 12)
    static var pokemonType: UIFont = systemFont(ofSize: 17, weight: .medium)
}
