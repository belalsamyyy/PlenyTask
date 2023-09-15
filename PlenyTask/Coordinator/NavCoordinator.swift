//
//  NavCoordinator.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/14/23.
//

import Foundation
import Combine
import SwiftUI

extension AppCoordinator {
    
    func loadSplashScreen() {
        present(SplashView())
    }
    
    //MARK: - Authentication
    
    func loadContentScreen() {
        loadSplashScreen()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: { [weak self] in
            let vm = SignInVM()
            self?.present(SignInView(vm: vm))
        })
    }

    
    //MARK: - Home
    
}

