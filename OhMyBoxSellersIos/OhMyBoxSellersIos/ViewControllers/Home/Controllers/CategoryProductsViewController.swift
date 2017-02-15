//
//  CategoryProductsViewController.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 15/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CategoryProductsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var productsCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
    }
    
    func registerNibs() {
        collectionView.register(UINib.init(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
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

extension CategoryProductsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        
        return cell
    }
    
    
}

extension CategoryProductsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = 183 * UIView.widthScaleProportion()
        let height = 325 * UIView.heightScaleProportion()
        
        return CGSize(width: width, height: height)
        
    }
    
}
