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
    
    @Published var posts: [Post] = []
    
    //MARK: Init
    init(dataManager: NetworkRequestProtocol = NetworkRequest.shared) {
        self.dataManager = dataManager
        print("intialize HomeVM ...")
        getPosts()
    }
    
    //MARK: - Navigation

    
    //MARK: - Actions
    
    func getPosts() {
        dataManager.getPostsList().sink { [weak self] response in
            if let response = response.value {
                // SUCCESS
                print("fetched posts successfully !!")
                print("response => \(response)")
                self?.posts = response.posts
            }
        }.store(in: &subscriptions)
    }
    
}

