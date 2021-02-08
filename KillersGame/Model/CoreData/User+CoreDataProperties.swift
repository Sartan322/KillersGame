//
//  User+CoreDataProperties.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 05.02.2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var login: String?
    @NSManaged public var password: String?
    @NSManaged public var fullName: String?
    @NSManaged public var userId: UUID?
    @NSManaged public var lobby: Lobby?
    @NSManaged public var statistic: Statistic?

}

extension User : Identifiable {

}
