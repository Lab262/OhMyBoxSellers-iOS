//
//  ProductViewController.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 17/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        // Do any additional setup after loading the view.
    }
    
    func registerNibs() {
        tableView.register(UINib.init(nibName: "ProductCatalogTableViewCell", bundle: nil), forCellReuseIdentifier: ProductCatalogTableViewCell.identifier)
        tableView.register(UINib.init(nibName: "ProductLabelTableViewCell", bundle: nil), forCellReuseIdentifier: ProductLabelTableViewCell.identifier)
        tableView.register(UINib.init(nibName: "ProductOptionsTableViewCell", bundle: nil), forCellReuseIdentifier: ProductOptionsTableViewCell.identifier)
        tableView.register(UINib.init(nibName: "LastUpdatedAtTableViewCell", bundle: nil), forCellReuseIdentifier: LastUpdatedAtTableViewCell.identifier)
        tableView.register(UINib.init(nibName: "HeaderTitleSecondTypeTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderTitleSecondTypeTableViewCell.identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateCatalogCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCatalogTableViewCell.identifier) as! ProductCatalogTableViewCell
        cell.shadowColor = UIColor.colorWithHexString("838383")
        cell.shadowOpacity = 0.5
        cell.shadowRadius = 5
        
        return cell
    }
    
    func generateLabelCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductLabelTableViewCell.identifier) as! ProductLabelTableViewCell
        cell.name = product.name
        cell.price = product.price
        
        return cell
    }
    
    func generateOptionsCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductOptionsTableViewCell.identifier) as! ProductOptionsTableViewCell
        cell.colors = [.blue, .cyan, .darkGray, .green]
        cell.sizes = ["PP", "M", "G", "GG"]
        
        cell.setUpInsets()
        
        return cell
    }
    
    func generateLastUpdatedAtCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LastUpdatedAtTableViewCell.identifier) as! LastUpdatedAtTableViewCell
        cell.lastUpdatedAt = Date()
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProductViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows: Int
        
        switch section {
        case 0: numberOfRows = 3
        case 1: numberOfRows = 1
        default: numberOfRows = 0
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: cell = generateCatalogCell(tableView, cellForRowAt: indexPath)
            case 1: cell = generateLabelCell(tableView, cellForRowAt: indexPath)
            case 2: cell = generateOptionsCell(tableView, cellForRowAt: indexPath)
            default: cell = UITableViewCell()
            }
        case 1: cell = generateLastUpdatedAtCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0: height = 420.0
            case 1: height = 107.0
            case 2: height = 170.0
            default: height = 0
            }
        case 1: height = 44.0
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let height: CGFloat
        
        switch section {
        case 1: height = 32
        case 2, 3, 4: height = 114
        default: height = 0
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view: UIView?
        
        switch section {
        case 1: view = UIView()
        case 2:
            let header = tableView.dequeueReusableCell(withIdentifier: HeaderTitleSecondTypeTableViewCell.identifier) as! HeaderTitleSecondTypeTableViewCell
            header.titleLabel.text = "DADOS"
            header.iconImage.image = #imageLiteral(resourceName: "product_header_icon")
            header.showAll.isHidden = true
            
            view = header
        default: view = nil
        }
        
        return view
    }
}
