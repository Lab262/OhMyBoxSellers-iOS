//
//  CenterCellCollectionViewFlowLayout.swift
//  CenterCellCollectionView
//
//  Created by Huallyd Smadi on 23/11/2015.
//  Copyright (c) 2015 Huallyd Smadi. All rights reserved.
//

import UIKit

class CenterCellCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if let cv = self.collectionView {
            
            // descobrir celula atual
            // descrobrir indexpath da celula atual
            let cellSize = cv.visibleCells[0].frame.size
            
            let isGoingLeft = velocity.x < 0
            let isGoingLeftMultiplier = isGoingLeft ? -1 : 1
            
            let currentIndex = Int(((minimumLineSpacing + cv.contentOffset.x) / cellSize.width) + (isGoingLeft ? 1 : 0))
            let proposedIndex = currentIndex + (1 * isGoingLeftMultiplier)
            
            let currentIndexPath = IndexPath(item: currentIndex, section: 0)
            let proposedIndexPath = IndexPath(item: proposedIndex, section: 0)
            
//            let currentCellSize = cv.cellForItem(at: currentIndexPath)!.frame.size
//            let nextCellSize = cv.cellForItem(at: currentIndexPath)!.frame.size
            
            // descobrir direção do scroll
            
            
//            let focku = cv.convert(fock, to: cv.superview)
            // pegar posição da proxima célula(relativa à direção) (posição relativa à collectionview [contentInset])
            
//            let offsetX = cellSize.width * CGFloat(proposedIndex) + minimumLineSpacing * CGFloat(proposedIndex)
            
            
            if proposedIndex < 0 || proposedIndex > (cv.numberOfItems(inSection: 0) - 1) {
                // se não tiver proxima ou anterior, retorna proposedContentOffset
                return proposedContentOffset
            } else {
                // retornar
                let fock = cv.cellForItem(at: proposedIndexPath)!.frame
                let offsetX = fock.origin.x - sectionInset.left
                return CGPoint(x: offsetX, y: proposedContentOffset.y)
            }
            
//            let cvBounds = cv.bounds
//            
//            let cell = cv.visibleCells[0]
//            let halfWidth = cell.bounds.size.width * 0.5;
//            
//            let proposedContentOffsetCenterX = proposedContentOffset.x + halfWidth;
//            
//            if let attributesForVisibleCells = self.layoutAttributesForElements(in: cvBounds) {
//
//                var candidateAttributes : UICollectionViewLayoutAttributes?
//                for attributes in attributesForVisibleCells {
//                    
//                    // == Skip comparison with non-cell items (headers and footers) == //
//                    if attributes.representedElementCategory != UICollectionElementCategory.cell {
//                            continue
//                    }
//                    
//                    
//                    if (attributes.center.x == 0) || (attributes.center.x > (cv.contentOffset.x + halfWidth) && velocity.x < 0) {
//                        continue
//                    }
//                    
//                    // == First time in the loop == //
//                    guard let candAttrs = candidateAttributes else {
//                        candidateAttributes = attributes
//                        continue
//                    }
//                    
//                    let a = attributes.center.x - proposedContentOffsetCenterX
//                    let b = candAttrs.center.x - proposedContentOffsetCenterX
//                    
//                    if fabsf(Float(a)) < fabsf(Float(b)) {
//                        candidateAttributes = attributes;
//                    }
//                    
//                    
//                }
//                
////                 Beautification step , I don't know why it works!
//                guard let candidateAttrs = candidateAttributes else {
//                    return proposedContentOffset
//                }
//                
//                return CGPoint(x: floor(candidateAttrs.center.x - halfWidth), y: proposedContentOffset.y)
//                
//            }
//            
//            
        }
        
        // fallback
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
    }
   
}
