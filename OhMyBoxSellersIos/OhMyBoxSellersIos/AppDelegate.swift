//
//  AppDelegate.swift
//  OhMyBoxSellersIos
//
//  Created by Thiago-Bernardes on 10/7/16.
//  Copyright © 2016 Lab262. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import FBSDKCoreKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])
        
        
//        if FFDefaults.authTokenData == ""  || FFDefaults.authTokenData == nil {
//            let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
//            let vcToShow = storyboard.instantiateInitialViewController()
//            self.window?.rootViewController = vcToShow
        
//        } else {
//            let storyboard = UIStoryboard(name: "Home", bundle: nil)
//            let vcToShow = storyboard.instantiateInitialViewController()
//            self.window?.rootViewController = vcToShow
//        }
        Parse.initialize(with: AppConfig.parse.baseClientConfig)

        NotificationsManager.registerForNotifications()
        
        if let tabBarFont = UIFont(name: "Muli", size: 10) {
            UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: tabBarFont], for: .normal)
        }
        
        // Override point for customization after application launch.
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }


}

