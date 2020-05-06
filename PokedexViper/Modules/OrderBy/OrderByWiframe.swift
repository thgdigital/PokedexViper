//
//  OrderByWiframe.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 06/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import Foundation

protocol OrderByWiframeDelegate: class {
    func didSelected(type: OrderBySelected)
}

enum OrderBySelected {
    case smallestNumber
    case highestNumber
    case orderAZ
    case orderZA
}

class OrderByWiframe {
    
    weak var delegate: OrderByWiframeDelegate?
    
    func makeScreen() -> OrderByListView {
        let presenter = OrderByPresenter(wireframe: self)
        let orderView = OrderByListView()
        orderView.presenter = presenter
        return orderView
    }
    
    func orderBy(by: OrderBySelected) {
        delegate?.didSelected(type: by)
    }
}
