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
        
        let marginInset = view.frame.width/2 - collectionPickerController(collectionPickerController, sizeForItemAt: 0).width/2
        
        collectionPickerView.contentInset = UIEdgeInsets(top: 0, left: marginInset, bottom: 0, right: marginInset)
    }
    
    func setUpOutlets() {
        filterButton.setAttributedTitle(filterButton.titleLabel?.text?.with(characterSpacing: 2.3), for: .normal)
    }
    
    func registerNibs() {
        collectionView.register(UINib.init(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionPickerView.register(UINib.init(nibName: "CollectionPickerViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionPickerViewCell.identifier)
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
        
        cell.name = "BLUSA FLUFFY"
        cell.price = 50.0
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
        return 3
    }
    
    func collectionPickerController(_ collectionPickerController: CollectionPickerController, titleForOptionAt index: Int) -> String {
        
        let title: String
        switch index {
        case 0: title = "TUDO"
        case 1: title = "CROPPED"
        case 2: title = "WHATEVER"
        default: title = ""
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
