//
//  AppDelegate.swift
//  eScaner
//
//  Created by Abdullah Mamun on 13/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }
}

