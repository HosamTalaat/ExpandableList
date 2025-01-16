//
//  AppDelegate.swift
//  ExpandableList
//
//  Created by Hossam Tal3t on 15/01/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initApp()
        return true
    }
 
}
extension AppDelegate {
    func initApp() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = ExpandableListVC()
        let rootNav = UINavigationController(rootViewController: rootVC)
        rootNav.navigationBar.isHidden = true
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()
    }
}
