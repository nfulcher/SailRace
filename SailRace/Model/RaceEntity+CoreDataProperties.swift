//
//  RaceEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 22/06/2023.
//
//

import Foundation
import CoreData


extension RaceEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RaceEntity> {
        return NSFetchRequest<RaceEntity>(entityName: "RaceEntity")
    }

    @NSManaged public var eventName: String?
    @NSManaged public var raceNumber: Int64
    @NSManaged public var name: String?
    @NSManaged public var placing: String?

}

extension RaceEntity : Identifiable {

}
