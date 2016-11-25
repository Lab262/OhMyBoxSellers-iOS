//
//  FormFieldFooterActionCell.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 25/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

protocol FormFieldActionCellDelegate {
    func sendForm()
}

class FormFieldFooterActionCell: UITableViewCell {

    static let cellIdentifier = "FormFieldFooterActionCell"

    var formFieldActionCellDelegate: FormFieldActionCellDelegate?
    @IBAction func doFormAction(_ sender: Any) {
        self.formFieldActionCellDelegate?.sendForm()
    }

}
