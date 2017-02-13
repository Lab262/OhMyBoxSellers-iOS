//
//  ProductCategoryTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 13/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductCategoryTableViewCell: UITableViewCell {

    static let identifier = "productCategoryCell"
    static let nameLabelBaseFontSize: CGFloat = 22.0
    static let countLabelBaseFontSize: CGFloat = 19.0
    
    static var nameLabelFontSize: CGFloat {
        return nameLabelBaseFontSize * UIView.heightScaleProportion()
    }
    
    static var countLabelFontSize: CGFloat {
        return countLabelBaseFontSize * UIView.heightScaleProportion()
    }
    
    var category: (name: String, count: Int)? {
        didSet {
            if let category = category {
                nameLabel.text = category.name
                countLabel.text = "\(category.count) peças"
            }
        }
    }
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        setUpViewShadow()

        
    }
    
    func setUpFontSizes() {
        nameLabel.font = nameLabel.font.withSize(ProductCategoryTableViewCell.nameLabelFontSize)
        countLabel.font = countLabel.font.withSize(ProductCategoryTableViewCell.countLabelFontSize)
    }
    
    func setUpViewShadow() {
        //Couldn't be made in storyboard
        
        view.layer.cornerRadius = 5.0
        
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowColor = UIColor.colorWithHexString("838383").cgColor
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 0.2
    }
}
