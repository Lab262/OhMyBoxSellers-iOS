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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch indexPath.row {
        case 0: cell = generateCatalogCell(tableView, cellForRowAt: indexPath)
        case 1: cell = generateLabelCell(tableView, cellForRowAt: indexPath)
        case 2: cell = generateOptionsCell(tableView, cellForRowAt: indexPath)
        default: cell = UITableViewCell()
        }
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height: CGFloat
        
        switch indexPath.row {
        case 0: height = 420.0
        case 1: height = 107.0
        case 2: height = 170.0
        default: height = 0
        }
        
        return height
    }
}
