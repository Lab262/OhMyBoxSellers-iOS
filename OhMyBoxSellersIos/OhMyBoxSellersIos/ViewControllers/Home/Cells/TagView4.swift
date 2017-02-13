//
//  TagView4.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 08/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class TagView4: UIView {

    @IBOutlet weak var collectionBrandName: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TagView4", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
