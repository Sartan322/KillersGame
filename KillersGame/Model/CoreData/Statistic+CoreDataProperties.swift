//
//  Statistic+CoreDataProperties.swift
//  KillersGame
//
//  Created by Павел Прокопьев on 05.02.2021.
//
//

import Foundation
import CoreData


extension Statistic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Statistic> {
        return NSFetchRequest<Statistic>(entityName: "Statistic")
    }

    @NSManaged public var kills: Int16
    @NSManaged public var deaths: Int16
    @NSManaged public var wins: Int16
    @NSManaged public var user: User?

}

extension Statistic : Identifiable {

}
