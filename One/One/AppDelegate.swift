//
//  AppDelegate.swift
//  One
//
//  Created by Petar Lemajic on 9/27/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavigationBar()
        return true
    }
    
    fileprivate func setupNavigationBar() {
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isTranslucent = true
    }
}

