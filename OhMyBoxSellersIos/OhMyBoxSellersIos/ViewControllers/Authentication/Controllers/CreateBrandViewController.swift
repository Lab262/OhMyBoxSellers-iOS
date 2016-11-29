//
//  CreateAccountViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class CreateBrandViewController: UIViewController {
    
    var brandToCreate = Brand()
    var userToCreate = User()
    
    var inputFieldsData =  [
        (icon: #imageLiteral(resourceName: "iconBrandName") , placeholderText: "nome da marca", filledText: ""),
        (icon: #imageLiteral(resourceName: "iconBrandDescription") , placeholderText: "descrição", filledText: ""),
        (icon: #imageLiteral(resourceName: "iconPhone") , placeholderText: "telefone", filledText: ""),
        (icon: #imageLiteral(resourceName: "iconPhone") , placeholderText: "email", filledText: "")
    ]
    
    @IBOutlet weak var tableView: TextInputTableView!
    
    @IBAction func backToLogin(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 0
        })
        self.navigationController!.popViewController(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
    }
}

extension CreateBrandViewController: FormFieldActionCellDelegate {
    
    func sendForm() {
        if self.getFieldsDataAndValidate() == true {
            //send image before 
//            self.brandToCreate.saveInCloud() {
//                (error,newBrand: Brand?) in
//                
//                
//            }
        }
    }

}

extension CreateBrandViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.inputFieldsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpFieldCell.cellIdentifier) as! SignUpFieldCell
        
        cell.cellData = self.inputFieldsData[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: SignUpHeaderCell.cellIdentifier) as! SignUpHeaderCell
        
//                header.cellData = #imageLiteral(resourceName: "registerFotoPlaceholder")
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer = tableView.dequeueReusableCell(withIdentifier: FormFieldFooterActionCell.cellIdentifier) as! FormFieldFooterActionCell
        footer.formFieldActionCellDelegate = self
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 251
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension CreateBrandViewController : FormFieldCellDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupTextFields()
    }
    
    func getFieldsDataAndValidate() -> Bool{
        
        for (index, _) in self.inputFieldsData.enumerated() {
            let currentCellIndexPath = IndexPath(row: index, section: 0)
            let cell = tableView.cellForRow(at: currentCellIndexPath) as! SignUpFieldCell
            
            if cell.textField.text == "" {
                let  msgError = "Está faltando o campo " + cell.cellData!.placeholderText
                self.present(ViewUtil.alertControllerWithTitle(_title: "Cuidado !", _withMessage: msgError), animated: true, completion: nil)
                return false
            }

            switch index {
            case 0:
                brandToCreate.name = cell.textField.text!
                break
            case 1:
                brandToCreate.myDescription = cell.textField.text!
                break
            case 2:
                brandToCreate.brandPhone = cell.textField.text!
                break
            case 3:
                brandToCreate.email = cell.textField.text!
            break
            default:
                break
            }
        }
        return true
    }
    
    func setupTextFields() {
        
        for i in 0..<self.inputFieldsData.count {
            
            let currentCellIndexPath = IndexPath(row: i, section: 0)
            if let cell = tableView.cellForRow(at: currentCellIndexPath) as? SignUpFieldCell {
                
                cell.formFieldCellDelegate = self
                
                let lastCellIndexPath = IndexPath(row: i - 1, section: 0)
                if let lastCell = tableView.cellForRow(at: lastCellIndexPath) as? SignUpFieldCell {
                    lastCell.textField.nextField = cell.textField
                }
                
                if i == self.inputFieldsData.count - 1 {
                    cell.textField.returnKeyType = .done
                }
            }
        }
    }
    
    func formFieldCellShouldReturn(_ cell: SignUpFieldCell) -> Bool {
        
        switch cell.textField.returnKeyType {
        case .done:
            self.view.window?.endEditing(true)
            self.sendForm()
            break
        default:
            cell.textField.nextField?.becomeFirstResponder()
        }
        
        return true
    }
}
