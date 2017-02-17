//
//  ProductCatalogTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 17/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductCatalogTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indexCollectionView: UICollectionView!
    @IBOutlet weak var accessoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
