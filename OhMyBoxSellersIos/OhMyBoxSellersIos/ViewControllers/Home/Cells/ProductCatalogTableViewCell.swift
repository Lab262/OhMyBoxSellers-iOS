//
//  ProductCatalogTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 17/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductCatalogTableViewCell: UITableViewCell {

    
    
    var photos: [UIImage] = [#imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder")]
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var indexCollectionView: UICollectionView!
    @IBOutlet weak var accessoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        // Initialization code
    }
    
    func registerNibs() {
        
        imagesCollectionView.register(UINib.init(nibName: "ProductImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProductImageCollectionViewCell.identifier)
        indexCollectionView.register(UINib.init(nibName: "PageIndexCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PageIndexCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateImageCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImageCollectionViewCell.identifier, for: indexPath) as! ProductImageCollectionViewCell
        cell.photo = photos[indexPath.item]
        
        return cell
    }
    
    func generateIndexCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageIndexCollectionViewCell.identifier, for: indexPath) as! PageIndexCollectionViewCell
        cell.index = indexPath.item + 1
        
        return cell
    }
    
}

extension ProductCatalogTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell
        
        switch collectionView {
        case imagesCollectionView: cell = generateImageCell(collectionView, cellForItemAt: indexPath)
        case indexCollectionView: cell = generateIndexCell(collectionView, cellForItemAt: indexPath)
        default: cell = UICollectionViewCell()
        }
        
        return cell
    }
}
