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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak self] in
            self?.present(ContentView())
        })
    }

    
    //MARK: - Home
    
}

