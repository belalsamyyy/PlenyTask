//
//  UserEntity+CoreDataProperties.swift
//  PlenyTask
//
//  Created by Belal Samy on 9/16/23.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var gender: String?
    @NSManaged public var image: String?
    @NSManaged public var token: String?

}

extension UserEntity : Identifiable {

}
