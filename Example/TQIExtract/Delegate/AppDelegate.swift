//
//  AppDelegate.swift
//  DIOExtract
//
//  Created by tqi-valves on 01/10/2022.
//  Copyright (c) 2022 tqi-valves. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: ExtractExampleViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}

