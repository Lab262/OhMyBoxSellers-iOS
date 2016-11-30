//
//  CreateAccountViewController.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 01/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FalconFrameworkIOSSDK

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonSquare: UIView!
    
    
    @IBAction func registerUser(_ sender: Any) {
        if let msgError = verifyInformations(){
            self.present(ViewUtil.alertControllerWithTitle(_title:"erroo", _withMessage:msgError), animated: true, completion: nil)
            
            return
        }
        
        let newUser = User()
        newUser.name = self.nameTextField.text
        newUser.email = self.emailTextField.text
        newUser.password = self.passwordTextField.text
        
        newUser.saveInCloud { (error, newUser: User?) in
            
            if (error == nil && newUser != nil){
                
                self.present( self.alertControllerActionWithTitle("Sucesso!!", _withMessage:"Abra o link de verificação que foi enviado para seu email em \(newUser!.email!) e depois faça o login"), animated: true, completion: nil)
                
            }else {
                
                var errorMsg = error?.detail ?? "Response error"
                
                if error?.statusCode == 403 {
                    errorMsg = "Email/Senha já está sendo usado(a)"
                }
                
                self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage:errorMsg), animated: true, completion: nil)
            }
        }
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
            self.navigationController?.popViewController(animated: true)
        }))
        
        return alert
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
                    
                    let data:[String:AnyObject] = result as! [String : AnyObject]
                    
                    let socialMediaId = data["id"] as! String
                    let email = data["email"] as! String
                    let name = "\(data["first_name"] as! String) \(data["last_name"])"
                    
                    FFAuthRequests.loginUserWithSocialMedia(
                        socialMediaId: socialMediaId,
                        email: email,
                        name: name,
                        socialMediaType: .facebook,
                        socialMediaPasswordServerSecret: "AQWgd$j[QGe]Bh.Ugkf>?B3y696?2$#B2xwfN3hrVhFrE348g",
                        autoStoreAuthTokenData: true) { (error, tokenReturnData) in
                            
                            if error == nil,
                                let user = tokenReturnData?["user"] as? NSDictionary,
                                let userId = user["id"] as? Int {
                                self.getUserBrands(userId:  "\(userId)")
                            } else {
                                self.view.unload()
                                self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage: error!.detail!), animated: true, completion: nil)
                            }
                    }
                }
            })
        }
    }
    
    @IBAction func showLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getUserBrands(userId: String) {
        
        let brandOfTheUserQuery = FFQuery().filterWhere(property: "id", condition: .isInSet, value: "(SELECT \"public\".\"UserHasBrands\".\"BrandId\" from \"public\".\"UserHasBrands\" WHERE \"public\".\"UserHasBrands\".\"UserId\" = \(userId))")
        
        Brand.findAllInCloud(queryParams: brandOfTheUserQuery) {
            (error, brands: [Brand]?) in
            self.showNextScreenBasedOnBrandData(brands: brands)
        }
    }
    
    func showNextScreenBasedOnBrandData(brands: [Brand]?) {
        
        if let brandArray = brands, brandArray.count < 1 {
            
            let registerBrandController = ViewUtil.viewControllerFromStoryboardWithIdentifier("Authentication", identifier: "CreateBrandViewController") as! CreateBrandViewController
            
            registerBrandController.inputFieldsData = registerBrandController.inputFieldsData.filter({ (textFieldData) -> Bool in
                return textFieldData.placeholderText != "email"
                    && textFieldData.placeholderText != "senha"
            })
            
            self.navigationController?.pushViewController(registerBrandController, animated: true)
            
        } else {
            self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Home")!, animated: true, completion: nil)
        }
        
    }
    
}

extension CreateAccountViewController: UITextFieldDelegate {}

//Mark: Animations
extension CreateAccountViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let _ = segue.destination as? LoginViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
        self.doBackgroundChangeAnimation()
    }
    
    func doBackgroundChangeAnimation() {
        
        //Author - André Brandão
        UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveEaseInOut, animations: {
            
            if self.buttonSquare.backgroundColor == UIColor.squaresButtonBlueColor {
                
                self.buttonSquare.backgroundColor = UIColor.squaresButtonPinkColor
                
            } else {
                
                self.buttonSquare.backgroundColor = UIColor.squaresButtonBlueColor
            }
            
        }) { (finished) in
            
            if finished {
                self.doBackgroundChangeAnimation()
            }
        }
        
    }
}
