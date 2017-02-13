//
//  HomeMainViewController.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 03/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class HomeMainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderTitleTableViewCell.identifier)
    }
    
    let productCategories: [(name: String, count: Int)] = [("Blusas", 30), ("Calças", 13), ("Acessórios", 7), ("Vestidos", 9), ("Sapatos", 8)]
    
    let productCount = 120

    @IBAction func logout(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
        let vcToShow = storyboard.instantiateInitialViewController()
        self.present(vcToShow!, animated: true, completion: nil)
        DefaultsHelper.sharedInstance.email = ""
        
        self.show(vcToShow!, sender: self)

    }
}

extension HomeMainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return productCategories.count
        case 1: return 0
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let category = productCategories[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductCategoryTableViewCell.identifier) as! ProductCategoryTableViewCell
            cell.category = category
            
            return cell
            
        case 1: break
        default: break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 11.0 + 46.0 * view.frame.height / 667.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleTableViewCell.identifier) as! HeaderTitleTableViewCell
        
        switch section {
        case 0:
            header.firstTitleLineLabel.text = "Você tem"
            header.secondTitleLineLabel.text = "\(productCount) produtos"
            header.iconImage.image = #imageLiteral(resourceName: "header_icon")
        case 1: break
        default: return nil
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 76.0
    }
    
}
