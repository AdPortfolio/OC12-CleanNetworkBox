//
//  AppDelegate.swift
//  OC12-CleanNetworkBox
//
//  Created by Walim Aloui on 11/08/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = CreateNameViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemOrange,
        ]
        navigationController.navigationBar.tintColor = .systemOrange
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
