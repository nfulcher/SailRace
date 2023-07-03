//
//  RaceEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 28/06/2023.
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
    @NSManaged public var event: EventEntity?
    @NSManaged public var racers: NSSet?

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
