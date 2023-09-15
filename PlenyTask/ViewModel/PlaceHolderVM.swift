//
//  PlaceHolderVM.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation
import Combine
import SwiftUI

class PlaceHolderVM: ObservableObject {
    
    var dataManager: NetworkRequestProtocol
    var subscriptions: [AnyCancellable] = []
    
    //MARK: Init
    init(dataManager: NetworkRequestProtocol = NetworkRequest.shared) {
        self.dataManager = dataManager
        print("intialize PlaceHolderVM ...")
    }
    
    //MARK: - Navigation

    
    //MARK: - Actions
    
}
