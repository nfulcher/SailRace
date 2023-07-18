//
//  SkipperEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 17/07/2023.
//
//

import Foundation
import CoreData


extension SkipperEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SkipperEntity> {
        return NSFetchRequest<SkipperEntity>(entityName: "SkipperEntity")
    }

    @NSManaged public var boatNumber: String?
    @NSManaged public var name: String?
    @NSManaged public var skipperID: UUID?
    @NSManaged public var event: NSSet?
    @NSManaged public var races: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown skipper"
    }
    public var wrappedBoatNumber: String {
        boatNumber ?? "Unknown boat number"
    }

}

// MARK: Generated accessors for event
extension SkipperEntity {

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: EventEntity)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: EventEntity)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}

// MARK: Generated accessors for races
extension SkipperEntity {

    @objc(addRacesObject:)
    @NSManaged public func addToRaces(_ value: RaceEntity)

    @objc(removeRacesObject:)
    @NSManaged public func removeFromRaces(_ value: RaceEntity)

    @objc(addRaces:)
    @NSManaged public func addToRaces(_ values: NSSet)

    @objc(removeRaces:)
    @NSManaged public func removeFromRaces(_ values: NSSet)

}

extension SkipperEntity : Identifiable {

}
