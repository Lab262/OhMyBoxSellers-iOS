//
//  URLS.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 18/11/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import FalconFrameworkIOSSDK

#if DEVELOPMENT
let URL_WS_SERVER = "https://ohmybox-stg.herokuapp.com/api"
#else
let URL_WS_SERVER = "https://ohmybox-prod.herokuapp.com/api"
#endif

class URLS: NSObject {

    static func setupBaseURL() {
            FFDefaults.hostBaseURL = URL_WS_SERVER
    }
    
}
