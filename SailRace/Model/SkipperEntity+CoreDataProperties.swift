//
//  SkipperEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 22/06/2023.
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
    @NSManaged public var races: NSSet?

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
