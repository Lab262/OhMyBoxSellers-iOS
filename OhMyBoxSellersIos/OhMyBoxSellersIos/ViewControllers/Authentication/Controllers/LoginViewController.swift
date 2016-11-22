//
//  LoginViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FalconFrameworkIOSSDK

let KEY_EMAIL = "email"
let KEY_PASS = "pass"
let KEY_CONFIRM_PASS = "confirmationPass"
class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    var dictionaryTextFields = Dictionary <String, String>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
         FBSDKLoginManager().logOut()
    }

    @IBAction func loginApp(_ sender: AnyObject) {
        
        if let msgError = self.verifyInformations() {
            
            self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage: msgError), animated: true, completion: nil)
            
          
            return
        }
        self.getRequestLogin()
    }
    
    @IBAction func loginWithFacebook(_ sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
          
            if error == nil {
                self.view.loadAnimation()
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                
                if (result?.isCancelled)! {
                    self.view.unload()
                    return
                }
                
                if(fbloginresult.grantedPermissions.contains("email")) {
                    
                    self.returnUserData()
                    
                }
            } else {
            
            }
            
        }

        
    
    }
    func returnUserData(){
        
        if((FBSDKAccessToken.current()) != nil){
            
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                
                if (error == nil) {
                    
                    print(result)
                    
                    let data:[String:AnyObject] = result as! [String : AnyObject]
//                    
//                    UserRequest.loginUserWithFacebook(id: data["id"] as! String, email: data["email"] as! String,mediaType:SocialMediaType.facebook.rawValue, completionHandler: { (success, msg, user) in
//                        
//                            if success {
//                            Defaults.sharedInstance.isLogged = true
//                            self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!, animated: true, completion: nil)
//
//                                print (user)
//                            }else {
//                                self.view.unload()
//                                self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage: msg), animated: true, completion: nil)
//                            }
//                    })
                    
                    
                    
                }
            })
        }
    }
    
    
    
    func verifyInformations() -> String? {
        self.getFields()
        var msgErro: String?
        
        if self.dictionaryTextFields[KEY_EMAIL] == nil || self.dictionaryTextFields[KEY_EMAIL] == "" {
            
            msgErro = "Email inválido"
            
            return msgErro
        }
        
        if self.dictionaryTextFields[KEY_PASS] == nil || self.dictionaryTextFields[KEY_PASS] == "" {
            
            msgErro = "Senha inválida"
            
            return msgErro
        }
        
        return msgErro
        
    }
    
    func getFields(){
        self.view.endEditing(true)
        self.dictionaryTextFields[KEY_PASS] = passwordTextField.text
        self.dictionaryTextFields[KEY_EMAIL] = loginTextField.text
    }
    
    func getRequestLogin(){
        self.view.endEditing(true)
        
        FFAuthRequests.loginUser(email: loginTextField.text!,password: passwordTextField.text!){
            (error, tokenReturnData) in
            
            if error != nil {
                   self.present( self.alertControllerActionWithTitle("", _withMessage:"Seja bem vindo!"), animated: true, completion: nil)
            } else {
                   self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage:error!.detail!), animated: true, completion: nil)
            }

        }
    }
    
    func alertControllerActionWithTitle (_ _title: String, _withMessage _message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
             self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!, animated: true, completion: nil)
        }))
        return alert
    }
    
}
