//
//  RaceEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 30/07/2023.
//
//

import Foundation
import CoreData


extension RaceEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RaceEntity> {
        return NSFetchRequest<RaceEntity>(entityName: "RaceEntity")
    }

    @NSManaged public var placing: String?
    @NSManaged public var raceID: UUID?
    @NSManaged public var raceNumber: Int64
    @NSManaged public var event: NSSet?
    @NSManaged public var racers: NSSet?

}

// MARK: Generated accessors for event
extension RaceEntity {

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: EventEntity)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: EventEntity)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}

// MARK: Generated accessors for racers
extension RaceEntity {

    @objc(addRacersObject:)
    @NSManaged public func addToRacers(_ value: SkipperEntity)

    @objc(removeRacersObject:)
    @NSManaged public func removeFromRacers(_ value: SkipperEntity)

    @objc(addRacers:)
    @NSManaged public func addToRacers(_ values: NSSet)

    @objc(removeRacers:)
    @NSManaged public func removeFromRacers(_ values: NSSet)

}

extension RaceEntity : Identifiable {

}
