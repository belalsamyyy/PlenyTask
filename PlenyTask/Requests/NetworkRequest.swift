//
//  NetworkRequest.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation
import Combine
import Alamofire


//MARK: - Network requests protocols

protocol NetworkRequestProtocol {
    func login(username: String, password: String) -> AnyPublisher<DataResponse<User, NetworkError> ,Never> // Login
    func getPostsList(limit: Int, skip: Int) -> AnyPublisher<DataResponse<Posts, NetworkError> ,Never> // posts list
    func getPostDetails(id: Int) -> AnyPublisher<DataResponse<Post, NetworkError> ,Never> // post details ( with ID )
    func searchPosts(query: String) -> AnyPublisher<DataResponse<Posts, NetworkError> ,Never> // search
}

//MARK: - Network Singleton Manager

class NetworkRequest {
    static let shared: NetworkRequestProtocol = NetworkRequest()
    private init() { }
}


// conform requests protocol functions ...
extension NetworkRequest: NetworkRequestProtocol {
    
    
    //MARK: - Login
    
    func login(username: String, password: String) -> AnyPublisher<Alamofire.DataResponse<User, NetworkError>, Never> {
        let url = URL(string: "\(BASE_URL)\(API.PostLogin.url)")! // I'm sure it's not Nil
        let headers: HTTPHeaders = ["Accept-Content-Type": "application/json"]
        let param: Parameters = ["username": username , "password": password]
        
        // feedback for request inputs
        print("URL => \(url)")
        print("Params => \(param)")
        
        return AF.request(url, method: .post, parameters: param ,encoding: JSONEncoding.default, headers: headers)
            .validate()
            .publishDecodable(type: User.self)
            .map{ response in
                response.mapError { error in
                    print("error =>", error.localizedDescription)
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on:DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    //MARK: - Posts
    
    func getPostsList(limit: Int, skip: Int) -> AnyPublisher<Alamofire.DataResponse<Posts, NetworkError>, Never> {
        let url = URL(string: "\(BASE_URL)\(API.GetPosts(limit: limit, skip: skip).url)")! // I'm sure it's not Nil
        let headers: HTTPHeaders = ["Accept-Content-Type": "application/json"]
        
        print("Token => ...")
        print("URL => \(url)")
        
        return AF.request(url, method: .get, parameters: nil ,encoding: JSONEncoding.default, headers: headers)
            .validate()
            .publishDecodable(type: Posts.self)
            .map{ response in
                response.mapError { error in
                    print("error =>", error.localizedDescription)
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on:DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func getPostDetails(id: Int) -> AnyPublisher<Alamofire.DataResponse<Post, NetworkError>, Never> {
        let url = URL(string: "\(BASE_URL)\(API.GetPost(id: id).url)")! // I'm sure it's not Nil
        let headers: HTTPHeaders = ["Accept-Content-Type": "application/json"]
        
        print("Token => ...")
        print("URL => \(url)")
        
        return AF.request(url, method: .get, parameters: nil ,encoding: JSONEncoding.default, headers: headers)
            .validate()
            .publishDecodable(type: Post.self)
            .map{ response in
                response.mapError { error in
                    print("error =>", error.localizedDescription)
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on:DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    
    
    //MARK: - Search Posts

    func searchPosts(query: String) -> AnyPublisher<Alamofire.DataResponse<Posts, NetworkError>, Never> {
        let url = URL(string: "\(BASE_URL)\(API.GetPostsSearch(query: query).url)")! // I'm sure it's not Nil
        let headers: HTTPHeaders = ["Accept-Content-Type": "application/json"]
        
        print("Token => ...")
        print("URL => \(url)")
        
        return AF.request(url, method: .get, parameters: nil ,encoding: JSONEncoding.default, headers: headers)
            .validate()
            .publishDecodable(type: Posts.self)
            .map{ response in
                response.mapError { error in
                    print("error =>", error.localizedDescription)
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on:DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
 
