//
//  GenerationListView.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 05/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class GenerationListView: UICollectionViewController {
    
    var presenter: GenerationPresenterInput!
    
    var items:[Generationitem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter.viewdLoad()
      
    }
    
    func setupCollectionView() {
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        let nibName = UINib(nibName: "GenerationCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: GenerationCell.identifier)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
          return
        }
        layout.itemSize = CGSize(width:  (UIScreen.main.bounds.width / 2) - 5, height: 129)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 2)
        layout.minimumInteritemSpacing = .zero
        layout.minimumLineSpacing = 4.0
    }


    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenerationCell.identifier, for: indexPath) as! GenerationCell
    
        // Configure the cell
        cell.populate(item: items[indexPath.row])
        return cell
    }
}
extension GenerationListView: GenerationPresenterOutput {
    func result(items: [Generationitem]) {
        self.items = items
        collectionView.reloadData()
    }
    
    
}
