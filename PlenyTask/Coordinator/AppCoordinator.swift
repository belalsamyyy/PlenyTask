//
//  AppCoordinator.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/14/23.
//

import Foundation
import Combine
import SwiftUI
import UIKit

enum AppState {
    case first
    case anonymous
    case user
}

class AppCoordinator {
    var appState = PassthroughSubject<AppState, Never>()
    var navigationController: UINavigationController
    var subscriptions: [AnyCancellable] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        appState.sink { [weak self] appState  in
            switch appState {
            case .first:
                print("appState => first")
                self?.loadSignInScreen()
                
            case .anonymous:
                print("appState => anonymous")
                
            case .user:
                print("appState => user")
                
            }
        }.store(in: &subscriptions)
    }
    
    
    //MARK: - Present View Controller
    
    func present<V: View>(_ view: V, style: UIModalPresentationStyle = .fullScreen, title: String = "", isRoot: Bool = false, isNavigationBarHidden: Bool = false, animate: Bool = true) {
        let viewController = PlenyHostingController(rootView: view)
        viewController.isNavigationBarHidden = isNavigationBarHidden
        viewController.modalPresentationStyle = style
        
        if navigationController.presentedViewController != nil {
            if let nav = navigationController.presentedViewController as? UINavigationController {
                nav.pushViewController(viewController, animated: animate)
            }
            return
        }
        
        if navigationController.viewControllers.isEmpty {
            navigationController.viewControllers = [viewController]
            return
        }
        
        if isRoot {
            navigationController.setViewControllers([viewController], animated: animate)
        } else {
            navigationController.present(viewController, animated: false, completion: nil)
        }
    }
    
    //MARK: - Dismiss View Controller

    func dismiss() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.dismiss(animated: true)
        }
    }
    
    
    //MARK: - Push View Controller
    
    func push<V: View>(_ view: V, title: String = "", isRoot: Bool = false, isNavigationBarHidden: Bool = false, animate: Bool = true) {
        let viewController = PlenyHostingController(rootView: view)
        viewController.isNavigationBarHidden = isNavigationBarHidden
        
        if navigationController.presentedViewController != nil {
            if let nav = navigationController.presentedViewController as? UINavigationController {
                nav.pushViewController(viewController, animated: animate)
            }
            return
        }
        
        if navigationController.viewControllers.isEmpty {
            navigationController.viewControllers = [viewController]
            return
        }
        
        if isRoot {
            navigationController.setViewControllers([viewController], animated: animate)
        } else {
            navigationController.pushViewController(viewController, animated: animate)
        }
    }
    
    
    //MARK: - Pop View Controller ( back )

    func pop() {
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
    }
    
}



//MARK: - Pleny Hosting Controller

class PlenyHostingController<Content: View>: UIHostingController<Content> {
    var isNavigationBarHidden: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = isNavigationBarHidden
    }
}

