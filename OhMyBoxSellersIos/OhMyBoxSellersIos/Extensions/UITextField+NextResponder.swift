//
//  UITextField+NextResponder.swift
//  skinca
//
//  Created by Thiago-Bernardes on 5/12/16.
//  Copyright © 2016 360Medlink. All rights reserved.
//

import UIKit

private var kAssociationKeyNextField: UInt8 = 0

extension UITextField {
    @IBOutlet var nextField: UITextField? {
        get {
            return objc_getAssociatedObject(self.superview?.superview, &kAssociationKeyNextField) as? UITextField
        }
        set(newField) {
            objc_setAssociatedObject(self.superview?.superview, &kAssociationKeyNextField, newField, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
}
