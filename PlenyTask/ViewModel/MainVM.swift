//
//  MainVM.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation
import SwiftUI
import Combine

class MainViewVM: ObservableObject{
    @Published var placeHolderVM: PlaceHolderVM
    
    var tabItems = TabBarItem.allCases
    @Published var selected: TabBarItem = .home

    var dataManager: NetworkRequestProtocol
    var subscriptions: [AnyCancellable] = []
    
    //MARK: Init
    init(dataManager: NetworkRequestProtocol = NetworkRequest.shared, placeHolderVM: PlaceHolderVM, selected: TabBarItem = .home) {
        print("intialize MainViewVM ...")
        
        self.dataManager = dataManager
        self.selected = selected
       
        self.placeHolderVM = placeHolderVM
    }
    
    //MARK: - Navigation
    
    
    //MARK: - Actions
    
}
