//
//  ProductLabelTableViewCell.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 20/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductLabelTableViewCell: UITableViewCell {

    static let identifier = "productLabelCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var name: String? {
        didSet {
            if let name = name {
                nameLabel.attributedText = name.with(characterSpacing: 4.2)
            } else {
                nameLabel.attributedText = nil
            }
        }
    }
    
    var price: Double? {
        didSet {
            if let price = price {
                let priceString = String(format: "%.2lf", price).replacingOccurrences(of: ".", with: ",")
                priceLabel.attributedText = priceString.with(characterSpacing: 2.06)
            } else {
                priceLabel.attributedText = nil
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
