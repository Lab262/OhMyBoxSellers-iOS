//
//  PageIndexCollectionViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 17/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class PageIndexCollectionViewCell: UICollectionViewCell {

    static let identifier = "pageIndexCell"
    
    static let selectedTextColor = UIColor.white
    static let selectedBackgroundColor = UIColor.colorWithHexString("D0C3DD")
    
    static let unselectedTextColor = UIColor.colorWithHexString("4C4159")
    static let unselectedBackgroundColor = UIColor.clear
    
    var index: Int = 0 {
        didSet {
            textLabel.text = String(index)
        }
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func changeToSelectedStyle() {
        textLabel.backgroundColor = PageIndexCollectionViewCell.selectedBackgroundColor
        textLabel.textColor = PageIndexCollectionViewCell.selectedTextColor
    }
    
    func changeToUnselectedStyle() {
        textLabel.backgroundColor = PageIndexCollectionViewCell.unselectedBackgroundColor
        textLabel.textColor = PageIndexCollectionViewCell.unselectedTextColor
    }

}
