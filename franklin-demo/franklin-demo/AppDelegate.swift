//
//  AppDelegate.swift
//  franklin-demo
//
//  Created by Jesse Chan on 12/19/19.
//  Copyright © 2019 Jesse Chan. All rights reserved.
//


import UIKit
import LeanCloud

let API = "https://teyfoihx.lc-cn-n1-shared.com"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var syncService: SyncService!
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //Authentication
    
        do {
            LCApplication.logLevel = .all //REMOVE FOR PUBLISHING
            try LCApplication.default.set(
                id: "tEyfOIHXQqhoLA5wqWketURi-gzGzoHsz",
                key: "UmhFSfnAO8N74gikLpMVr0rd",
                serverURL: "https://teyfoihx.lc-cn-n1-shared.com"
            )
            
            syncService = SyncService(modelTypes: [User.self])

        } catch {
            fatalError("\(error)")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

