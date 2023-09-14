//
//  AppDelegate.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/14/23.
//

import Foundation
import SwiftUI
import UIKit

@main
class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject  {
    var appCoordinator: AppCoordinator!
   
    
    // MARK: - didFinishLaunchingWithOptions

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("App Did Launch!")
        return true
    }

    
    // MARK: - UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
         let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
         sceneConfig.delegateClass = SceneDelegate.self
         return sceneConfig
    }
}
