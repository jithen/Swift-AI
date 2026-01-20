//
//  AppDelegate.swift
//  swift-ai
//
//  Created by Jithendra Jonnareddi on 1/20/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        // Set the navigation controller as the root view controller
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
    
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    
        return true
    }




}

