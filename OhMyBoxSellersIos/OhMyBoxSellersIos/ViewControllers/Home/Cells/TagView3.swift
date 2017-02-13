//
//  TagView3.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 07/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class TagView3: UIView {

    @IBOutlet weak var brandNameLabel: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TagView3", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
