//
//  Constants.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation

let BASE_URL = "https://dummyjson.com"

//MARK: - API URLs

enum API {
    case PostLogin // Login user and get token
    case GetPosts(limit: Int, skip: Int) // Get all posts ( limit & skip for pagination )
    case GetPost(id: Int) // Get a single post with ID
    case GetPostsSearch(query: String) // Search posts
    
    var url: String {
        switch self {
        case .PostLogin: return "/auth/login"
        case .GetPosts(let limit, let skip): return "/posts?limit=\(limit)&skip=\(skip)"
        case .GetPost(let id): return "/posts/\(id)"
        case .GetPostsSearch(let query): return "/posts/search?q=\(query)"
        }
    }
}

//MARK: - Responses Status

enum Status: Int {
    case SUCCUESS_200 = 200
    case NOT_FOUND_404 = 404
    case SERVER_ERROR_500 = 500
}

//MARK: - Main Tab bar Items

enum TabBarItem: String, CaseIterable {
    case home
    case shop
    case discount
    case gallery
    case profile
    
    var iconImage: String {
        switch self {
        case .home: return "icon-tabbar-home"
        case .shop: return "icon-tabbar-shop"
        case .discount: return "icon-tabbar-discount"
        case .gallery: return "icon-tabbar-gallery"
        case .profile: return "icon-tabbar-profile"
        }
    }
}

//MARK: - UserDefaults Keys

struct UserDefaultsKeys {
    // Auth
    static let isFirstTime = "IS_IT_FIRST_TIME"
    static let token = "TOKEN"
}

