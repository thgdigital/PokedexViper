//
//  HomeWireframe.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 03/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class HomeWireframe {
    
    static func make(window: UIWindow) -> HomeListView {
        let viewController = HomeListView()
        let navigation = UINavigationController(rootViewController: viewController)
        let navigationBar  = navigation.navigationBar
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .black
        navigationBar.isTranslucent = true
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        return viewController
    }
}
