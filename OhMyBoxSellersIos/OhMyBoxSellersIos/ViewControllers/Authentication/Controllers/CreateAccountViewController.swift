//
//  CreateAccountViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
        
        var msgErro: String?
        
        if self.emailTextField.text == nil || self.emailTextField.text == "" {
            
            msgErro = "Email inválido"
            
            return msgErro
        }
        
        if self.passwordTextField.text == nil ||  self.passwordTextField.text == "" {
            
            msgErro = "Senha inválida"
            
            return msgErro
        }
        if self.nameTextField.text == nil || self.nameTextField.text == "" {
            
            msgErro = "Nome inválido"
            
            return msgErro
        }
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

extension CreateAccountViewController:UITextFieldDelegate{
    
    
    
}
