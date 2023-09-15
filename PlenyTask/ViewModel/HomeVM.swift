//
//  HomeVM.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation
import Combine
import SwiftUI

class HomeVM: ObservableObject {
    
    var dataManager: NetworkRequestProtocol
    var subscriptions: [AnyCancellable] = []
    
    //MARK: Init
    init(dataManager: NetworkRequestProtocol = NetworkRequest.shared) {
        self.dataManager = dataManager
        print("intialize HomeVM ...")
    }
    
    //MARK: - Navigation

    
    //MARK: - Actions
    
}

