//
//  CollectionPickerController.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 16/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

protocol CollectionPickerDelegate: class {
    
    typealias OptionHandler = (Int) -> ()
    
    func numberOfOptions(in collectionPickerController: CollectionPickerController) -> Int
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, titleForOptionAt index: Int) -> String
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, handlerForOptionAt index: Int) -> OptionHandler
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, sizeForItemAt index: Int) -> CGSize
    
}

class CollectionPickerController: NSObject, UICollectionViewDataSource {
    
    weak open var delegate: CollectionPickerDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let delegate = delegate {
            return delegate.numberOfOptions(in: self)
        } else {
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let title = delegate!.collectionPickerController(self, titleForOptionAt: indexPath.item)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionPickerViewCell.identifier, for: indexPath) as! CollectionPickerViewCell
        cell.title = title
        
        return cell
    }
}

extension CollectionPickerController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let delegate = delegate {
            return delegate.collectionPickerController(self, sizeForItemAt: indexPath.item)
        } else {
            return CGSize()
        }
    }
}
