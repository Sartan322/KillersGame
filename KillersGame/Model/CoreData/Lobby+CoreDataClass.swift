//
//  Lobby+CoreDataClass.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 05.02.2021.
//
//

import Foundation
import CoreData


public class Lobby: NSManagedObject {
    func getUsers() -> NSSet?{
        return users
    }
}
