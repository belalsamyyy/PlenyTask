//
//  HomeVM.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation
import Combine
import SwiftUI
import Alamofire

class HomeVM: ObservableObject {
    
    var repository: Repository
    var subscriptions: [AnyCancellable] = []
    
    // infinite scroll pagination
    private let itemsPerPage = 10
    @Published var currentPage = 1
    @Published var isLoading = false
    
    @Published var isSearching = false
    @Published var searchQuery = ""
    @Published var posts: [Post] = []
    
    //MARK: Init
    init(repository: Repository = NetworkRepository(networkService: NetworkRequest.shared)) {
        self.repository = repository
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
        
        let fetchDataPublisher: AnyPublisher<DataResponse<Posts, NetworkError>, Never>
        
        if isSearching {
            fetchDataPublisher = repository.searchPosts(query: searchQuery)
        } else {
            fetchDataPublisher = repository.getPostsList(limit: limit, skip: skip)
        }
        
        fetchDataPublisher.sink { [weak self] response in
            if let response = response.value {
                // SUCCESS
                
                if self?.isSearching ?? false {
                    // search request
                    let paginatedPosts = response.posts.paginated(limit: limit, skip: skip) // do it manually !!
                    print("(search request ) load page \(self?.currentPage ?? 0) => query: \(self?.searchQuery ?? "") | new: \(paginatedPosts.count) posts | total: \((self?.posts.count ?? 0) + paginatedPosts.count)")
                    self?.posts.append(contentsOf: paginatedPosts)
                    self?.currentPage += 1
                    
                    
                } else {
                    // fetch request
                    print("(fetch request ) load page \(self?.currentPage ?? 0) => new: \(response.posts.count) posts | total: \((self?.posts.count ?? 0) + response.posts.count)")
                    self?.posts.append(contentsOf: response.posts)
                    self?.currentPage += 1
                    
                }
                
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
    
    func resetAndRefreshPostsList() {
        self.posts = []
        self.currentPage = 1
        self.getPosts()
    }
    
}
