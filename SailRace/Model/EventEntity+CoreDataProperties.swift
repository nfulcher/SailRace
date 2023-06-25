//
//  EventEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 22/06/2023.
//
//

import Foundation
import CoreData


extension EventEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventEntity> {
        return NSFetchRequest<EventEntity>(entityName: "EventEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var races: NSSet?

}

// MARK: Generated accessors for races
extension EventEntity {

    @objc(addRacesObject:)
    @NSManaged public func addToRaces(_ value: RaceEntity)

    @objc(removeRacesObject:)
    @NSManaged public func removeFromRaces(_ value: RaceEntity)

    @objc(addRaces:)
    @NSManaged public func addToRaces(_ values: NSSet)

    @objc(removeRaces:)
    @NSManaged public func removeFromRaces(_ values: NSSet)

}

extension EventEntity : Identifiable {

}
