//
//  SizeCollectionViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 20/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {

    static let identifier = "sizeCell"
    
    static let labelUnselectedColor = UIColor.colorWithHexString("9244EF")
    static let labelSelectedColor = UIColor.colorWithHexString("FFFFFF")
    
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    var size: String? {
        didSet {
            if let size = size {
                sizeLabel.attributedText = size.with(characterSpacing: 2.34)
            } else {
                sizeLabel.attributedText = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectedView.cornerRadius = selectedView.frame.height/2
    }

    override func changeToSelectedStyle() {
        sizeLabel.textColor = SizeCollectionViewCell.labelSelectedColor
        selectedView.isHidden = false
    }
    
    override func changeToUnselectedStyle() {
        sizeLabel.textColor = SizeCollectionViewCell.labelUnselectedColor
        selectedView.isHidden = true
    }
    
}
