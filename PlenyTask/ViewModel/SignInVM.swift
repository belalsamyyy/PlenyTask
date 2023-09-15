//
//  SignInVM.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation
import Combine
import SwiftUI

class SignInVM: ObservableObject {
    var openMainScreen = PassthroughSubject<TabBarItem, Never>()

    var dataManager: NetworkRequestProtocol
    var subscriptions: [AnyCancellable] = []
    
    //MARK: Init
    init(dataManager: NetworkRequestProtocol = NetworkRequest.shared) {
        self.dataManager = dataManager
        print("intialize SignInVM ...")
    }
    
    //MARK: - Navigation
    
    func openMainView(selected: TabBarItem) {
        openMainScreen.send(selected)
    }
    
    //MARK: - Actions
    
    func validateFieldsAndLogin(username: String, password: String) {
        do {
            let username = try username.validate(type: .required("User Name Field is Required !!")) // or .email "to check email addrses regex"
            let password = try password.validate(type: .password)
            
            //valid
            loginAction(username: username, password: password)
            
            // invalid
        } catch(let error) {
            print("ERROR => \((error as! ValidationError).message)")
            // Add Alert with the error message here ... ( later ) <<<<<
        }
    }
    
    private func loginAction(username: String, password: String) {
        dataManager.login(username: username, password: password).sink { [weak self] response in
            if let response = response.value {
                // SUCCESS
                print("You logged in successfully, \(response.firstName) 👋")
                print("response => ", response)
                
                Defaults.token = response.token
                print("User Token => \(Defaults.token)")
                
                // go to main view ...
                self?.openMainView(selected: .home)
                
            }
        }.store(in: &subscriptions)
    }
}
