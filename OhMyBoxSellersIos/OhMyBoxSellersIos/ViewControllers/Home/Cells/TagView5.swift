//
//  TagView5.swift
//  OhMyBox
//
//  Created by Huallyd Smadi on 22/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit

class TagView5: UIView {
    
    @IBOutlet weak var nameTagLabel: UILabel!

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TagView5", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
