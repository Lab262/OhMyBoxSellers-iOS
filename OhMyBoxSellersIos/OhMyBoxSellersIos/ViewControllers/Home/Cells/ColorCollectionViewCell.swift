//
//  ColorCollectionViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 20/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {

    static let identifier = "colorCell"
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var selectedView: UIImageView!
    
    var color: UIColor? {
        didSet {
            colorView.backgroundColor = color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.cornerRadius = colorView.frame.height/2
        // Initialization code
    }
    
    override func changeToSelectedStyle() {
        selectedView.isHidden = false
    }
    
    override func changeToUnselectedStyle() {
        selectedView.isHidden = true
    }

}
