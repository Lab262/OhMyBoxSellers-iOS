//
//  CenterCellCollectionViewFlowLayout.swift
//  CenterCellCollectionView
//
//  Created by Huallyd Smadi on 23/11/2015.
//  Copyright (c) 2015 Huallyd Smadi. All rights reserved.
//

import UIKit

class CenterCellCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    @IBInspectable var centerOffset = CGPoint()
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if let cv = self.collectionView {
            
            let isGoingLeft = velocity.x < 0
            let isGoingLeftMultiplier = isGoingLeft ? -1 : 1
            
            let offsetLocation = cv.contentOffset + CGPoint(x: sectionInset.left, y: sectionInset.top) + centerOffset
            
            var currentIndexPath: IndexPath?
            
            if let ci = cv.indexPathForItem(at: offsetLocation) {
                
                currentIndexPath = ci
                
            } else if let cell = closestCell(to: offsetLocation, cv) {
                
                let ci = cv.indexPath(for: cell)!
                currentIndexPath = ci
                
            } else {
                
                return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
            
            }
            
            if let currentIndexPath = currentIndexPath {
            
                let currentIndex = currentIndexPath.item
                let proposedIndex = currentIndex + (1 * isGoingLeftMultiplier)
                
                let proposedIndexPath: IndexPath
                if velocity.x == 0 {
                    proposedIndexPath = IndexPath(item: currentIndex, section: 0)
                } else {
                    proposedIndexPath = IndexPath(item: proposedIndex, section: 0)
                }
                
                
                if proposedIndexPath.item < 0 || proposedIndexPath.item > (cv.numberOfItems(inSection: 0) - 1) {
                    // se não tiver proxima ou anterior, retorna proposedContentOffset
                    return proposedContentOffset
                } else {
                    // retornar
                    let proposedCell: UICollectionViewCell
                    
                    if let cell = cv.cellForItem(at: proposedIndexPath) {
                        proposedCell = cell
                    } else {
                        
                        proposedCell = cv.cellForItem(at: currentIndexPath)!
                    }
                    let offsetX = proposedCell.frame.origin.x - sectionInset.left
                    return CGPoint(x: offsetX, y: proposedContentOffset.y)
                }
                
            } else {
                return proposedContentOffset
            }
            
        } else {
            
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
            
        }
    }
    
    func closestCell(to point: CGPoint, _ collectionView: UICollectionView) -> UICollectionViewCell? {
        let cells = collectionView.visibleCells
        
        guard cells.count > 0 else {
            return nil
        }
        
        var closestCell: UICollectionViewCell = cells[0]
        
        for i in 1..<cells.count {
            let cell = cells[i]
            
            if point.distance(to: cell.frame.origin) < point.distance(to: closestCell.frame.origin) {
                closestCell = cell
            }
        }
        
        return closestCell
    }
   
}
