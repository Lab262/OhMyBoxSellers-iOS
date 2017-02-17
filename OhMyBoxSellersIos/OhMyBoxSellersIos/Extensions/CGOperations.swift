//
//  CGOperations.swift
//  OhMyBoxSellersIos
//
//  Created by André Marques da Silva Rodrigues on 17/02/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

extension CGPoint {
    
    func distance(to point: CGPoint) -> CGFloat {
        return hypot(self.x - point.x, self.y - point.y)
    }
    
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
