//
//  Helper.swift
//  PokedexViper
//
//  Created by Thiago Vaz on 04/05/20.
//  Copyright © 2020 Thiago Vaz. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
    
    func shadowHome() {
        let radius: CGFloat = 10
               contentView.layer.cornerRadius = radius
               contentView.layer.borderWidth = 1
               contentView.layer.borderColor = UIColor.clear.cgColor
               contentView.layer.masksToBounds = true
        
        
        layer.shadowColor = UIColor(red: 0.545, green: 0.745, blue: 0.541, alpha: 0.4).cgColor
        layer.shadowOffset = CGSize(width: 0, height: radius)
        layer.shadowRadius = 20
        layer.shadowOpacity = 1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
        layer.position = self.center
    }
}

extension UIView {
    func shadow() {
        let radius: CGFloat = 10
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
}

extension UICollectionView {

  func reloadDataTwiceIfNeeded() {
    reloadData()

    if #available(iOS 11.0, *) {
      // do nothing
    }
    else {
      // do it only if bellow iOS 11
      reloadData()
    }
  }
  
  func reloadItemsInSection(sectionIndex: Int, newCount: Int? = nil, completion: (() -> Void)?) {
    self.performBatchUpdates({
      
      self.collectionViewLayout.invalidateLayout()
      
      var sectionItemsCount: Int = 0
      let collectionView: UICollectionView = self
      
      sectionItemsCount = collectionView.numberOfItems(inSection: sectionIndex)
  
      let countArray = [sectionItemsCount, newCount ?? 0]
      let maxCount = countArray.max() ?? 0
      let minCount = countArray.min() ?? 0
      
      var changed = [IndexPath]()
      for i in minCount..<maxCount {
        let indexPath = IndexPath(row: i, section: sectionIndex)
        changed.append(indexPath)
      }
      
      if (newCount ?? 0) > sectionItemsCount {
        collectionView.insertItems(at: changed)
        
      } else if sectionItemsCount > (newCount ?? 0) {
        collectionView.deleteItems(at: changed)
      }
      
    }, completion:  { _ in
      self.collectionViewLayout.invalidateLayout()
      
//      self.reloadLoadingCells(section: section)
      completion?()
    })
  }
  
    
  func reloadItemsInSection(_ section: Int, completion: (() -> Void)?) {
      
      self.performBatchUpdates({
        
        UIView.performWithoutAnimation {
          
          self.collectionViewLayout.invalidateLayout()
          self.reloadSections( IndexSet(integer: section) )
        }
        
      }) { (finished) in
        self.collectionViewLayout.invalidateLayout()
        completion?()
    }
  }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
