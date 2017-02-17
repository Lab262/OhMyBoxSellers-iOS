//
//  ProductCatalogTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 17/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductCatalogTableViewCell: UITableViewCell {

    static let identifier = "productCatalogCell"
    
    let sizeForImageCell = CGSize(width: 375 * UIView.widthScaleProportion(), height: 379 * UIView.heightScaleProportion())
    let sizeForIndexCell = CGSize(width: 35, height: 30)
    
    var photos: [UIImage] = [#imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder"), #imageLiteral(resourceName: "shirt_placeholder")]
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var indexCollectionView: UICollectionView!
    @IBOutlet weak var accessoryButton: UIButton!
    
    var selectedPage = 0 {
        didSet {
            
            cleanUpIndexCollectionViewSelection(at: IndexPath(row: oldValue, section: 0))
            
            updateImagesCollectionViewSelection()
            updateIndexCollectionViewSelection()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        
        (indexCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInset = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 22)
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

    func updateImagesCollectionViewSelection() {
        self.imagesCollectionView.scrollToItem(at: IndexPath.init(item: self.selectedPage, section: 0), at: .centeredHorizontally, animated: true)
        
    }
    
    func updateIndexCollectionViewSelection() {
        
        let indexPath = IndexPath.init(item: selectedPage, section: 0)
        
        if let cell = indexCollectionView.cellForItem(at: indexPath) as? PageIndexCollectionViewCell {
            cell.changeToSelectedStyle()
        }
        indexCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func cleanUpIndexCollectionViewSelection(at indexPath: IndexPath) {
        if let cell = indexCollectionView.cellForItem(at: indexPath) as? PageIndexCollectionViewCell {
            cell.changeToUnselectedStyle()
        }
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == indexCollectionView {
            if indexPath.item == selectedPage {
                let cell = cell as! PageIndexCollectionViewCell
                cell.changeToSelectedStyle()
            }
        }
    }
}

extension ProductCatalogTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == indexCollectionView {
            (collectionView.cellForItem(at: indexPath) as! PageIndexCollectionViewCell).changeToSelectedStyle()
            selectedPage = indexPath.item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == indexCollectionView {
            if let cell = collectionView.cellForItem(at: indexPath) as? PageIndexCollectionViewCell {
                cell.changeToUnselectedStyle()
            }
        }
    }
    
    ///////
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        updatePageIndex()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if imagesCollectionView.indexPathsForSelectedItems == nil {
            updatePageIndex()
        } else if imagesCollectionView.indexPathsForSelectedItems!.isEmpty {
            updatePageIndex()
        }
    }
    
    func updatePageIndex() {
        let currentPage = Int(0.5 + (imagesCollectionView.contentOffset.x / imagesCollectionView.frame.size.width))
        
        if currentPage != selectedPage {
            selectedPage = currentPage
        }
    }
}

extension ProductCatalogTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size: CGSize
        
        switch collectionView {
        case imagesCollectionView: size = sizeForImageCell
        case indexCollectionView: size = sizeForIndexCell
        default: size = CGSize()
        }
        
        return size
    }
}
