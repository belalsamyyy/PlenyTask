//
//  PostsRepository.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/16/23.
//

import Foundation
import Combine
import Alamofire
import CoreData

protocol Repository {
    func login(username: String, password: String) -> AnyPublisher<DataResponse<User, NetworkError>, Never>
    func getPostsList(limit: Int, skip: Int) -> AnyPublisher<DataResponse<Posts, NetworkError>, Never>
    func getPostDetails(id: Int) -> AnyPublisher<DataResponse<Post, NetworkError>, Never>
    func searchPosts(query: String) -> AnyPublisher<DataResponse<Posts, NetworkError>, Never>
}

protocol LocalRepository {
    func saveUser(_ user: User)
    func fetchUser() -> User?
    func savePost(_ post: Post)
    func fetchPost(byId id: Int) -> Post?
}
