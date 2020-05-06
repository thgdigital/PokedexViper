//
//  OrderByListView.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class OrderByListView: UIViewController {
    var presenter: OrderByPresenterInput!
    
    let titleLabel: UILabel = {
        let label = UILabel(text: "Sort", font: UIFont.applicationTitle, textColor: UIColor.textColor, textAlignment: .left, numberOfLines: 0)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel(text: "Sort Pokémons alphabetically or by National Pokédex number!", font: UIFont.pokemonDescription, textColor: UIColor.textColor, textAlignment: .left, numberOfLines: 0)
        return label
    }()
    
    lazy var buttonOrderBySmallestNumber: OrderButton = {
        let button = OrderButton(title: "Smallest number first", titleColor: UIColor.textColor)
        button.backgroundColor = UIColor.backgroundGenerations
        button.addTarget(self, action: #selector(sendSmallestNumber(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonOrderByHighestNumber: OrderButton = {
        let button = OrderButton(title: "Highest number first", titleColor: UIColor.textColor)
        button.backgroundColor = UIColor.backgroundGenerations
        button.addTarget(self, action: #selector(sendHighestNumber(_:)), for: .touchUpInside)
        return button
    }()
    lazy var buttonOrderByAZ: OrderButton = {
        let button = OrderButton(title: "A-Z", titleColor: UIColor.textColor)
        button.backgroundColor = UIColor.backgroundGenerations
        button.addTarget(self, action: #selector(sendOrderByAZ(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonOrderByZA: OrderButton = {
        let button = OrderButton(title: "Z-A", titleColor: UIColor.textColor)
        button.backgroundColor = UIColor.backgroundGenerations
        button.addTarget(self, action: #selector(sendOrderByZA(_:)), for: .touchUpInside)
        return button
    }()
    
    
    @objc func sendSmallestNumber(_ sender: Any?) {
        presenter.didTap(type: .smallestNumber)
    }
    
    @objc func sendHighestNumber(_ sender: Any?) {
        presenter.didTap(type: .highestNumber)
    }
    
    @objc func sendOrderByAZ(_ sender: Any?) {
        presenter.didTap(type: .orderAZ)
    }
    
    @objc func sendOrderByZA(_ sender: Any?) {
        presenter.didTap(type: .orderZA)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.stack(titleLabel,
                   descriptionLabel,
                   buttonOrderBySmallestNumber.withSize(.init(width: view.frame.width - 40, height: 60)),
                   buttonOrderByHighestNumber.withSize(.init(width: view.frame.width - 40, height: 60)),
                   buttonOrderByAZ.withSize(.init(width: view.frame.width - 40, height: 60)),
                   buttonOrderByZA.withSize(.init(width: view.frame.width - 40, height: 60)),
                   spacing: 8, distribution: .fillEqually)
                .padLeft(20)
            .padRight(20)
            .fillSuperview()
    }
}
