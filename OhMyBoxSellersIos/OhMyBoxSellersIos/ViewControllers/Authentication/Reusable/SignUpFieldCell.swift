//
//  SignUpFieldCell.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 24/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class SignUpFieldCell: UITableViewCell {

    static let cellIdentifier = "SignUpFieldCell"
    
    @IBOutlet weak var fieldIconImgView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var txtFieldDivider: UIView!
    
    var cellData: (icon: UIImage, placeholderText: String, filledText: String)? {
        didSet {
            self.setupCell()
        }
    }
    
    func setupCell() {
        
        self.fieldIconImgView.image = cellData?.icon
        self.textField.placeholder = cellData?.placeholderText
        self.textField.text = cellData?.filledText
    }

}
