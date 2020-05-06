//
//  OrderByPresenter.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

class OrderByPresenter: OrderByPresenterInput {
    
    let wireframe: OrderByWiframe
    
    init(wireframe: OrderByWiframe) {
        self.wireframe = wireframe
    }
    
    func didTap(type: OrderBySelected) {
        wireframe.orderBy(by: type)
    }
}
