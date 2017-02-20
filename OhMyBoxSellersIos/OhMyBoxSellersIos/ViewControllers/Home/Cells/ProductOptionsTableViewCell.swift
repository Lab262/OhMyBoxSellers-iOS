//
//  ProductOptionsTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 20/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductOptionsTableViewCell: UITableViewCell {

    static let identifier = "productOptionsCell"
    
    var colors: [UIColor] = []
    var sizes: [String] = []
    
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    @IBOutlet weak var sizesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
    }
    
    func setUpInsets() {
        
        centerContentHorizontally(in: colorsCollectionView)
        centerContentHorizontally(in: sizesCollectionView)
    }
    
    func centerContentHorizontally(in collectionView: UICollectionView) {
        
        guard let delegate = collectionView.delegate as? UICollectionViewDelegateFlowLayout else {
                return
        }
        
        let itemWidth: CGFloat = delegate.collectionView!(collectionView, layout: collectionView.collectionViewLayout, sizeForItemAt: IndexPath(item: 0, section: 0)).width
        
        let itemSpacing: CGFloat = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumLineSpacing
        let totalWidth: CGFloat = (CGFloat(sizes.count) * itemWidth) + (CGFloat(sizes.count - 1) * itemSpacing)
        
        let margin = (sizesCollectionView.frame.width - totalWidth)/2
        let edge = margin > 0 ? margin : itemWidth/2
        let inset = UIEdgeInsets(top: 0, left: edge, bottom: 0, right: edge)
        
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInset = inset
    }
    
    func registerNibs() {
        colorsCollectionView.register(UINib.init(nibName: "ColorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ColorCollectionViewCell.identifier)
        sizesCollectionView.register(UINib.init(nibName: "SizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SizeCollectionViewCell.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateColorCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.identifier, for: indexPath) as! ColorCollectionViewCell
        cell.color = colors[indexPath.item]
        
        return cell
    }
    
    func generateSizeCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCollectionViewCell.identifier, for: indexPath) as! SizeCollectionViewCell
        cell.size = sizes[indexPath.item]
        
        return cell
    }
    
}

extension ProductOptionsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let number: Int
        
        switch collectionView {
        case colorsCollectionView: number = colors.count
        case sizesCollectionView: number = sizes.count
        default: number = 0
        }
        
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell
        
        switch collectionView {
        case colorsCollectionView: cell = generateColorCell(collectionView, cellForItemAt: indexPath)
        case sizesCollectionView: cell = generateSizeCell(collectionView, cellForItemAt: indexPath)
        default: cell = UICollectionViewCell()
        }
        
        return cell
    }
}

extension ProductOptionsTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.changeToSelectedStyle()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.changeToUnselectedStyle()
    }
}

extension ProductOptionsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat
        let height: CGFloat
        
        switch collectionView {
        case colorsCollectionView:
            width = 58 * UIView.widthScaleProportion()
            height = 50 * UIView.widthScaleProportion()
        case sizesCollectionView:
            width = 50 * UIView.widthScaleProportion()
            height = 50 * UIView.widthScaleProportion()
        default:
            width = 0
            height = 0
        }
        
        return CGSize(width: width, height: height)
    }

    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView.contentSize.width < collectionView.frame.size.width {
//            let inset: CGFloat = (collectionView.frame.width - collectionView.contentSize.width)/2
//            return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
//        } else {
//            return UIEdgeInsets()
//        }
//    }
}
