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
    
    func loadSignInScreen() {
        loadSplashScreen()
        
        let vm = SignInVM()
        
        vm.openMainScreen.sink { [weak self] selected in
            self?.loadMainView(selected: selected)
        }.store(in: &self.subscriptions)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: { [weak self] in
            self?.present(SignInView(vm: vm), isRoot: true)
        })
    }
    
    
    //MARK: - Home
    
    func loadMainView(selected: TabBarItem, isItBackAction: Bool = false) {
        let vm = MainViewVM(placeHolderVM: PlaceHolderVM(), selected: selected)
        
        if !isItBackAction {
            present(MainView(vm: vm))
        } else {
            print(2)
            pop()
        }
    }
    
}

