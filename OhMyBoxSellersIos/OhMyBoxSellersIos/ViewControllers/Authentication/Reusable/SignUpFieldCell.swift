//
//  SignUpFieldCell.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 24/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

protocol FormFieldCellDelegate {
    func formFieldCellShouldReturn(_ cell: SignUpFieldCell) -> Bool
}

class SignUpFieldCell: UITableViewCell {

    static let cellIdentifier = "SignUpFieldCell"
    
    var formFieldCellDelegate: FormFieldCellDelegate?
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
        self.textField.delegate = self
    }
    
}

extension SignUpFieldCell : UITextFieldDelegate {
 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let shouldReturn = self.formFieldCellDelegate?.formFieldCellShouldReturn(self){
            return shouldReturn
        } else {
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: {
            self.txtFieldDivider.alpha = 0.75
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: {
            self.txtFieldDivider.alpha = 0.25
        })
    }
    
}

