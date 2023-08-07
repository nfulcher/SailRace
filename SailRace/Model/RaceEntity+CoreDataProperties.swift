//
//  RaceEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 06/08/2023.
//
//

import Foundation
import CoreData


extension RaceEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RaceEntity> {
        return NSFetchRequest<RaceEntity>(entityName: "RaceEntity")
    }

    @NSManaged public var placing: String?
    @NSManaged public var raceNumber: Int64
    @NSManaged public var event: NSSet?
    @NSManaged public var racers: NSSet?
    
    public var wrappedRaceNumber: Int {
        Int(raceNumber)
    }
    public var wrappedPlacing: String {
        placing ?? "1st"
    }
    
    public var eventArray: [EventEntity] {
        let set = event as? Set<EventEntity> ?? []
        
        return set.sorted {
            $0.wrappedEventName < $1.wrappedEventName
        }
    }
    
    public var racersArray: [SkipperEntity] {
        let set = racers as? Set<SkipperEntity> ?? []
        
        return set.sorted {
            $0.wrappedBoatNumber < $1.wrappedBoatNumber
        }
    }

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
