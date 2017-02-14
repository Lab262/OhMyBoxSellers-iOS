//
//  ClosetTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 14/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ClosetTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "closetCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        collectionView.setScaledDesginParam(scaledPattern: .horizontalCenter, maxScale: 1.0, minScale: 0.97, maxAlpha: 1.0, minAlpha: 0.8)
        // Initialization code
    }
    
    func registerNibs() {
        collectionView.register(UINib.init(nibName: "ShowCaseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ShowCaseCollectionViewCell.identifier)
    }

}

extension ClosetTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowCaseCollectionViewCell.identifier, for: indexPath) as! ShowCaseCollectionViewCell
        
        return cell
    }
}

extension ClosetTableViewCell: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.bounds.size.width * 0.94
        let height = width*1.25
        
        //1.2
        return CGSize(width: width, height: height)
        
    }
    
    
}
