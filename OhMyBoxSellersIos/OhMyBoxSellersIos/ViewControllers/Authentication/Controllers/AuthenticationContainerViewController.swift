//
//  ContainerViewController.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 24/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class AuthenticationContainerViewController: UIViewController {

    
    @IBOutlet weak var pinkBackgroundImage: UIImageView!
    @IBOutlet weak var backgroundImageBlue: UIImageView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.window?.endEditing(true)
    }
    
    func doBackgroundChangeAnimation() {
        
        //Author - André Brandão
        UIView.animate(withDuration: 5.0, delay: 0.0, options: .curveEaseInOut, animations: {
            
            if self.backgroundImageBlue.alpha == 1 {
                self.backgroundImageBlue.alpha = 0
            } else {
                self.backgroundImageBlue.alpha = 1
            }
            if self.pinkBackgroundImage.alpha == 1 {
                self.pinkBackgroundImage.alpha = 0
            } else {
                self.pinkBackgroundImage.alpha = 1
            }
            
        }) { (finished) in
            
            if finished {
                self.doBackgroundChangeAnimation()
            }
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.doBackgroundChangeAnimation()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
