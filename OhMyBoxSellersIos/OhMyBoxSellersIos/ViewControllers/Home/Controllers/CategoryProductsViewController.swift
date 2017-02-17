//
//  CategoryProductsViewController.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 15/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

typealias Product = (name: String, price: Double)

class CategoryProductsViewController: UIViewController {
    
    var products: [Product] = [("BLUSA FLUFFY", 50.0), ("GO GREEN", 50.0), ("CASA DA MÃE", 50.0), ("PANO MESMO", 50.0)]
    
    var selectedProduct: Product {
        let indexPath = collectionView.indexPathsForSelectedItems![0]
        return products[indexPath.item]
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var productsCountLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var collectionPickerView: UICollectionView!
    
    let collectionPickerController = CollectionPickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setUpOutlets()
        setUpCollectionPickerView()
    }
    
    func setUpCollectionPickerView() {
        collectionPickerController.delegate = self
        collectionPickerView.delegate = collectionPickerController
        collectionPickerView.dataSource = collectionPickerController
        collectionPickerController.collectionView = collectionPickerView
        
        let marginInset = view.frame.width/2 - collectionPickerController(collectionPickerController, sizeForItemAt: 0).width/2
        
        (collectionPickerView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInset = UIEdgeInsets(top: 0, left: marginInset, bottom: 0, right: marginInset)
    }
    
    func setUpOutlets() {
        filterButton.setAttributedTitle(filterButton.titleLabel?.text?.with(characterSpacing: 2.3), for: .normal)
    }
    
    func registerNibs() {
        collectionView.register(UINib.init(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionPickerView.register(UINib.init(nibName: "CollectionPickerViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionPickerViewCell.identifier)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.categoryProductsToProduct {
            
        }
    }
    
}

extension CategoryProductsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.item]
        
        cell.name = product.name
        cell.price = product.price
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

extension CategoryProductsViewController: CollectionPickerDelegate {
    
    func numberOfOptions(in collectionPickerController: CollectionPickerController) -> Int {
        return 5
    }
    
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, titleForOptionAt index: Int) -> String {
        
        let title: String
        switch index {
        case 0: title = "TUDO"
        case 1: title = "CROPPED"
        default: title = "WHATEVER"
        }
        
        return title
    }
    
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, handlerForOptionAt index: Int) -> CollectionPickerOptionHandler? {
        return {
            print("Handling \(index)")
        }
    }
    
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, sizeForItemAt index: Int) -> CGSize {
        
        let width = collectionPickerView.frame.width / 3
        let height = collectionPickerView.frame.size.height
        
        return CGSize(width: width, height: height)
    }
}
