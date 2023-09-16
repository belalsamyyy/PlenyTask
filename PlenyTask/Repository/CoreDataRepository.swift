//
//  LocalRepository.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/16/23.
//

import Foundation
import Combine
import CoreData

class CoreDataRepository: LocalRepository {
    private let managedObjectContext: NSManagedObjectContext

    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    func saveUser(_ user: User) {
        let userEntity = UserEntity(context: managedObjectContext)
        userEntity.id = Int32(user.id)
        userEntity.username = user.username
        userEntity.email = user.email
        userEntity.firstName = user.firstName
        userEntity.lastName = user.lastName
        userEntity.gender = user.gender
        userEntity.image = user.image
        userEntity.token = user.token

        try? managedObjectContext.save()
    }

    func fetchUser() -> User? {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()

        if let userEntity = try? managedObjectContext.fetch(fetchRequest).first {
            return User(id: Int(userEntity.id),
                        username: userEntity.username ?? "",
                        email: userEntity.email ?? "",
                        firstName: userEntity.firstName ?? "",
                        lastName: userEntity.lastName ?? "",
                        gender: userEntity.gender ?? "",
                        image: userEntity.image ?? "",
                        token: userEntity.token ?? "")
        }
        return nil
    }
    
    func savePost(_ post: Post) {
        let postEntity = PostEntity(context: managedObjectContext)
        postEntity.id = Int32(post.id)
        postEntity.title = post.title
        postEntity.body = post.body
        postEntity.userId = Int32(post.userId)
        postEntity.tags = post.tags as NSObject
        postEntity.reactions = Int32(post.reactions)
        try? managedObjectContext.save()
    }

    func fetchPost(byId id: Int) -> Post? {
        let fetchRequest: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        if let postEntity = try? managedObjectContext.fetch(fetchRequest).first {
            return Post(id: Int(postEntity.id),
                        title: postEntity.title ?? "",
                        body: postEntity.body ?? "",
                        userId: Int(postEntity.userId),
                        tags: postEntity.tags as? [String] ?? [],
                        reactions: Int(postEntity.reactions))
        }
        return nil
    }
}
