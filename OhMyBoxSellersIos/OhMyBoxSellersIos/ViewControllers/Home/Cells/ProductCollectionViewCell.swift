//
//  ProductCollectionViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 15/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "productCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
}
