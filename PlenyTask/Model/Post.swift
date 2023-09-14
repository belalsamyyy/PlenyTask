//
//  Post.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/15/23.
//

import Foundation

struct Posts: Codable {
    let posts: [Post]
    let total: Int
    let skip: Int
    let limit: Int
}

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
    let tags: [String]
    let reactions: Int
}

//{
//  "posts": [
//    {
//      "id": 1,
//      "title": "His mother had always taught him",
//      "body": "His mother had always taught him not to ever think of himself as better than others. He'd tried to live by this motto. He never looked down on those who were less fortunate or who had less money than him. But the stupidity of the group of people he was talking to made him change his mind.",
//      "userId": 9,
//      "tags": [
//          "history",
//          "american",
//          "crime"
//      ],
//      "reactions": 2
//    },
//    {...},
//    {...}
//    // 30 items
//  ],
//  "total": 150,
//  "skip": 0,
//  "limit": 30
//}
