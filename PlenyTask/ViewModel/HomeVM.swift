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
    
    // infinite scroll pagination
    private let itemsPerPage = 10
    private var currentPage = 1
    @Published var isLoading = false
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
        guard !isLoading else { return }
        isLoading = true
        
        let limit = itemsPerPage
        let skip = (currentPage - 1) * itemsPerPage
        
        dataManager.getPostsList(limit: limit, skip: skip).sink { [weak self] response in
            if let response = response.value {
                // SUCCESS
                print("fetched posts successfully !!")
                //print("response => \(response)")
                print("load page \(self?.currentPage ?? 0) => new: \(response.posts.count) posts | total: \(self?.posts.count ?? 0)")
                
                self?.posts.append(contentsOf: response.posts)
                self?.currentPage += 1
                self?.isLoading = false
            }
        }.store(in: &subscriptions)
    }
    
    //MARK: - Pagination
    
    func loadMoreDataIfNeeded(currentItem item: Post) {
        let thresholdIndex = posts.index(posts.endIndex, offsetBy: -5)
        if posts.firstIndex(where: { $0.id == item.id }) == thresholdIndex && !isLoading {
            getPosts()
        }
    }

    
}

