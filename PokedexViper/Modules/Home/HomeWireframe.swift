//
//  HomeWireframe.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 03/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit
import FittedSheets

class HomeWireframe {
    
    var navigationcontroller: UINavigationController?
    var sheetController:SheetViewController?
    var viewController: HomeListView?
    let interactor = HomeInteractor(manager: PokemonManager())
    
    func make(window: UIWindow) -> HomeListView {
        let presenter = HomePresenter(interactor: interactor, wiframe: self)
        interactor.output = presenter
        let viewController = HomeListView()
        self.viewController = viewController
        viewController.presenter = presenter
        presenter.output = viewController
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
    
    func showGenerations() {
        let wireframe = GenerationWiframe()
        wireframe.delegate = self
        sheetController(viewController: wireframe.makeScreen())
    }
    
    func showSort(){
        let wiframe = OrderByWiframe()
        wiframe.delegate = self
        sheetController(viewController: wiframe.makeScreen())
    }
    
    fileprivate func sheetController(viewController: UIViewController)  {
        let sheetController = SheetViewController(controller: viewController, sizes: [.fixed(850), .fullScreen])
        self.sheetController = sheetController
        // Adjust how the bottom safe area is handled on iPhone X screens
        sheetController.blurBottomSafeArea = false
        sheetController.adjustForBottomSafeArea = true

        // Turn off rounded corners
        sheetController.topCornersRadius = 0

        // Make corners more round
        sheetController.topCornersRadius = 15

        // Disable the dismiss on background tap functionality
        sheetController.dismissOnBackgroundTap = false

        // Extend the background behind the pull bar instead of having it transparent
        sheetController.extendBackgroundBehindHandle = true
        
        self.viewController?.present(sheetController, animated: false, completion: nil)
    }
}
extension  HomeWireframe: GenerationWiframeDelegate, OrderByWiframeDelegate {
    func didSelected(type: OrderBySelected) {
        sheetController?.closeSheet(completion: {
            print(type)
        })
    }
    
    func result(pokemons: [GenerationPokemonEntity]) {
        sheetController?.closeSheet(completion: {
            self.viewController?.presenter.updatePokemon(pokemos: pokemons)
        })
    }
}
