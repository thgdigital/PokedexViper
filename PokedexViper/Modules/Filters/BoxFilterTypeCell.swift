//
//  BoxFilterCell.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 07/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

class BoxFilterTypeCell: CollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
          collectionView.scrollsToTop = false
          collectionView.dataSource = self
          collectionView.delegate = self
            collectionView.register(UINib(nibName: String(describing: FilterCell.self), bundle: nil), forCellWithReuseIdentifier: "Cell")
        }
    }
    
    var items = [FiltersIcoItem]() {
       didSet {
         collectionView.reloadData()
       }
     }
    
    var collectionViewOffset: CGFloat {
      set {
        collectionView.contentOffset.x = newValue
      }
      
      get {
        return collectionView.contentOffset.x
      }
    }

}
extension BoxFilterTypeCell: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = items[indexPath.item]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FilterCell
    cell.populate(icos: item)
    return cell
  }
    
}
