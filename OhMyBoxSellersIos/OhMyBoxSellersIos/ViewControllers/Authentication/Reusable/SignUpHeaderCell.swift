//
//  SignUpHeaderCell.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 24/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SignUpHeaderCell: UITableViewCell {
    
    static let cellIdentifier = "SignUpHeaderCell"
    
    @IBOutlet weak var brandImgView: UIImageView!
    
    var cellData: UIImage? {
        didSet {
            self.setupCell()
        }
    }
    
    func setupCell() {
        
        if let brandImage = self.cellData {
            self.brandImgView.image = brandImage
        } else{
            self.brandImgView.image = #imageLiteral(resourceName: "registerFotoPlaceholder")
        }
        
    }

    
}
