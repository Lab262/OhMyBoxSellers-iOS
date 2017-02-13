//
//  ShowCaseCollectionViewCell.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 18/10/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class ShowCaseCollectionViewCell: UICollectionViewCell {

    static let identifier = "showCaseCell"
    var followingClothes = false
    
    var tagView: TagView?
    var tagView2: TagView2?
    var tagView3: TagView3?
    var tagView4: TagView4?
    var tagView5: TagView5?
    var tagType: Int? {
        didSet {
           self.initializeTagView()
        }
    }
    @IBOutlet weak var showCaseImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if tagType! == 0 {
            
            return
        }else if tagType! == 1 {
            
            self.tagView?.center = CGPoint(x: self.frame.width/2-45, y: self.frame.height/2+125)
            self.addSubview(tagView!)
            
        } else if tagType! == 2 {
            
            let widthTagView2 = self.frame.width*0.860 // width cell / width tag
            let heightTagView2  = widthTagView2*0.247

            self.tagView2?.frame.size = CGSize(width: widthTagView2, height: heightTagView2)
            self.tagView2?.center = CGPoint(x: self.frame.width/2.2, y: self.frame.height/1.11)
          
            
            
        } else if tagType! == 3 {
            

            tagView3?.center = CGPoint(x: self.frame.width/3.25, y: self.frame.height/1.25)
            
            self.addSubview(tagView3!)
            
        } else if tagType! == 4 {

            self.tagView4?.center = CGPoint(x: self.frame.width/2.45, y: self.frame.height/1.25)
            self.tagView4?.collectionBrandName.text = "Neon Go"
            self.addSubview(tagView4!)
            
        } else {
            
            let widthTagView5 = self.frame.width*0.627
            let heightTagView5  = widthTagView5*0.289 //the height is 0.289 of the width size, height/widht
            
            self.tagView5?.frame.size = CGSize(width: widthTagView5, height: heightTagView5)
            
            self.tagView5?.center = CGPoint(x: self.frame.width/3.05, y: self.frame.height/1.08)
            self.tagView5?.nameTagLabel.text = "VERÃO DE SAIAS"
            self.tagView5?.layoutIfNeeded()
        }
        

    }
    func initializeTagView(){
        
        if tagType! == 0 {
            return
            
        } else if tagType! == 1 {
            
            self.tagView?.removeFromSuperview()
            self.tagView = TagView.instanceFromNib() as? TagView
          
            
        } else if tagType! == 2 {
            
            self.tagView2?.removeFromSuperview()
            self.tagView2 = TagView2.instanceFromNib() as? TagView2
            
            self.tagView2?.followButton.isSelected = followingClothes
            self.tagView2?.setInitialButtonState()
 
            self.addSubview(tagView2!)
            
        } else if tagType! == 3 {
            
            self.tagView3?.removeFromSuperview()
            self.tagView3 = TagView3.instanceFromNib() as? TagView3
  
            
        } else if tagType! == 4 {
            
            self.tagView4?.removeFromSuperview()
            self.tagView4 = TagView4.instanceFromNib() as? TagView4
            
        } else {
            
            self.tagView5?.removeFromSuperview()
            self.tagView5 = TagView5.instanceFromNib() as? TagView5
            self.addSubview(tagView5!)
        }
        
    }
}
