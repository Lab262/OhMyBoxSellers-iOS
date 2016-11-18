//
//  HomeMainViewController.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 03/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HomeMainViewController: UIViewController {

    @IBAction func logout(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
        let vcToShow = storyboard.instantiateInitialViewController()
        self.present(vcToShow!, animated: true, completion: nil)
        DefaultsHelper.sharedInstance.email = ""
        
        self.show(vcToShow!, sender: self)

    }
  
    
}
