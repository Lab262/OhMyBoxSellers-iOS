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
    
    
    var name: String? {
        didSet {
            nameLabel.attributedText = name?.with(characterSpacing: 1.68)
        }
    }
    
    var price: Double? {
        didSet {
            if let price = price {
                let priceString = String(format: "R$ %.2lf", price).replacingOccurrences(of: ".", with: ",")
                priceLabel.attributedText = priceString.with(characterSpacing: 1.68)
            } else {
                priceLabel.attributedText = nil
            }
        }
    }
}
