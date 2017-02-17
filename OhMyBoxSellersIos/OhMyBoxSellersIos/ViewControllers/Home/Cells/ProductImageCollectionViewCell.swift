//
//  ProductImageCollectionViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 17/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductImageCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "productImageCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo: UIImage? {
        didSet {
            photoImageView.image = photo
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
