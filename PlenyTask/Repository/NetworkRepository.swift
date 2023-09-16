//
//  NetworkRepository.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/16/23.
//

import Foundation
import Combine
import Alamofire

class NetworkRepository: Repository {
    private let networkService: NetworkRequestProtocol

    init(networkService: NetworkRequestProtocol) {
        self.networkService = networkService
    }

    func login(username: String, password: String) -> AnyPublisher<DataResponse<User, NetworkError>, Never> {
        return networkService.login(username: username, password: password)
            .eraseToAnyPublisher()
    }

    func getPostsList(limit: Int, skip: Int) -> AnyPublisher<DataResponse<Posts, NetworkError>, Never> {
        return networkService.getPostsList(limit: limit, skip: skip)
            .eraseToAnyPublisher()
    }

    func getPostDetails(id: Int) -> AnyPublisher<DataResponse<Post, NetworkError>, Never> {
        return networkService.getPostDetails(id: id)
            .eraseToAnyPublisher()
    }

    func searchPosts(query: String) -> AnyPublisher<DataResponse<Posts, NetworkError>, Never> {
        return networkService.searchPosts(query: query)
            .eraseToAnyPublisher()
    }
}

