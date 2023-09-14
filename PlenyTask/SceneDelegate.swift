//
//  SceneDelegate.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/14/23.
//

import Foundation
import SwiftUI
import UIKit

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    static weak var shared: SceneDelegate?
    weak var appDelegate = UIApplication.shared.delegate as? AppDelegate

    //MARK: - navigationViewController
    
    lazy var navigationViewController: UINavigationController = {
        let navController = UINavigationController()
        return navController
    }()
    
    //MARK: - scene LifeCycle

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        print("SceneDelegate is connected!")
        Self.shared = self
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        self.navigationViewController.isNavigationBarHidden = true
        window.overrideUserInterfaceStyle = .light // enforce light mode
        
        window.rootViewController = self.navigationViewController
        self.window = window
        window.makeKeyAndVisible()
        
        setupAppFlow()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    //MARK: - setup App flow
    
    func setupAppFlow() {
        // Manage app flow with conditions later, like token existence, or anything else ...
        // ====================================================================================
        //appDelegate?.appCoordinator.appState.send(.first) // first time open the app
        //appDelegate?.appCoordinator.appState.send(.user)  // signed-in user
        //appDelegate?.appCoordinator.appState.send(.anonymous)  // anonymous user
        
        appDelegate?.appCoordinator.appState.send(.first)
    }
}
