//
//  CreateAccountViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var tableView: TextInputTableView!
    
    var inputFieldsData = ["foi","foi","foi"]
    
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
    
    
    @IBAction func registerUser(_ sender: Any) {
        if let msgError = verifyInformations(){
            self.present(ViewUtil.alertControllerWithTitle(_title:"erroo", _withMessage:msgError), animated: true, completion: nil)
            
            return
        }
        
        //        let user = User(_name: self.nameTextField.text!, _email:self.emailTextField.text!)
        //
        //        UserRequest.createAccountUser(user:user, pass:self.passwordTextField.text!) { (success,msg) in
        //                if (success){
        //
        //                    self.present( self.alertControllerActionWithTitle("Sucesso!!", _withMessage:msg), animated: true, completion: nil)
        //
        //                }else {
        //                    self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage:msg), animated: true, completion: nil)
        //                }
        //
        //
        //        }
        
        
    }
    
    func verifyInformations() -> String? {
        
        let msgErro: String? = "Missing fields"
        
        return msgErro
        
    }
    
    func alertControllerActionWithTitle (_ _title: String, _withMessage _message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            //self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!, animated: true, completion: nil)
        }))
        return alert
    }
    
    
}

extension CreateAccountViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.inputFieldsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpFieldCell.cellIdentifier) as! SignUpFieldCell
        
        cell.cellData = (icon: #imageLiteral(resourceName: "iconPass_image"), placeholderText: "Senha", filledText: "")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: SignUpHeaderCell.cellIdentifier) as! SignUpHeaderCell
        
        
        //        header.cellData = #imageLiteral(resourceName: "registerFotoPlaceholder")
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 231
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension CreateAccountViewController : UITextFieldDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupTextFields()
    }
    
    func setupTextFields() {
        
        for i in 0..<self.inputFieldsData.count {
            
            let currentCellIndexPath = IndexPath(row: i, section: 0)
            if let cell = tableView.cellForRow(at: currentCellIndexPath) as? SignUpFieldCell {
                
                cell.textField.delegate = self
                
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField.returnKeyType {
        case .done:
            self.view.window?.endEditing(true)
            self.registerUser(self)
            break
        default:
            textField.nextField?.becomeFirstResponder()
        }
        return true
    }
    
}
