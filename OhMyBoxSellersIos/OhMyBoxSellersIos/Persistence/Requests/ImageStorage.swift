//
//  ImageStorage.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 29/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class ImageStorage: NSObject {
    
    static let storage = FIRStorage.storage()
    static let storageRef = storage.reference(forURL: "gs://ohmybox-4ea4e.appspot.com")

    static func uploadImage(_ imageToUpload: UIImage!,
                            inFolder folder: String,
                            completion: ((FIRStorageMetadata?,Error?) -> Void)?) -> FIRStorageUploadTask {
        
        
        let imageData = UIImagePNGRepresentation(imageToUpload)!
        
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/png"
        
        let imagesRef = storageRef.child(folder)
        let fileName = folder + Date().description + ".png"
        let spaceRef = imagesRef.child(fileName)
        
        return spaceRef.put(imageData, metadata: metadata, completion: completion)
        }
}

extension UIImageView {
    func setImageFromUrl(_ urlString: String,
                                placeholderImage: UIImage? = UIImage()) {
        
        let completionBlock: SDWebImageCompletionBlock =  { (image, error, cacheType, url) in
            
            self.fadeIn(0.1,
                        delay: 0.0,
                        completion: { finished in },
                        finalAlpha: 1.0)
        }

        let url = URL(string: urlString)
        self.sd_setImage(with: url, placeholderImage: placeholderImage, options: [], completed: completionBlock)
        
    }
}
