//
//  PostEntity+CoreDataProperties.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/16/23.
//
//

import Foundation
import CoreData

extension PostEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostEntity> {
        return NSFetchRequest<PostEntity>(entityName: "PostEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var userId: Int32
    @NSManaged public var reactions: Int32
    @NSManaged public var tags: NSObject?

}

extension PostEntity : Identifiable {

}
