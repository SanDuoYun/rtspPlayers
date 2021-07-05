//
//  AppDelegate.swift
//  TestRTSP1
//
//  Created by 巢云 on 2021/6/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = VLCPlayerVC()
        window?.makeKeyAndVisible()
        return true
    }
    // MARK: UISceneSession Lifecycle
}

