//
//  Lobby+CoreDataProperties.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 06.02.2021.
//
//

import Foundation
import CoreData


extension Lobby {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lobby> {
        return NSFetchRequest<Lobby>(entityName: "Lobby")
    }

    @NSManaged public var lobbyId: UUID?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension Lobby {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension Lobby : Identifiable {

}
