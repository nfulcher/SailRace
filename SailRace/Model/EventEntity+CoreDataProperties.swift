//
//  EventEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 06/08/2023.
//
//

import Foundation
import CoreData


extension EventEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventEntity> {
        return NSFetchRequest<EventEntity>(entityName: "EventEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var competitors: NSSet?
    @NSManaged public var eventRaces: NSSet?
    
    
    // 7/7 Paul Hudson
    public var wrappedEventName: String {
        name ?? "Unknown Event"
    }
    
    public var wrappedEventDate: Date {
        date ?? Date()
    }
    
    public var competitorArray: [SkipperEntity] {
        let set = competitors as? Set<SkipperEntity> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    public var racesArray: [RaceEntity] {
        let set = eventRaces as? Set<RaceEntity> ?? []
        
        return set.sorted {
            $0.wrappedRaceNumber < $1.wrappedRaceNumber
        }
    }

}

// MARK: Generated accessors for competitors
extension EventEntity {

    @objc(addCompetitorsObject:)
    @NSManaged public func addToCompetitors(_ value: SkipperEntity)

    @objc(removeCompetitorsObject:)
    @NSManaged public func removeFromCompetitors(_ value: SkipperEntity)

    @objc(addCompetitors:)
    @NSManaged public func addToCompetitors(_ values: NSSet)

    @objc(removeCompetitors:)
    @NSManaged public func removeFromCompetitors(_ values: NSSet)

}

// MARK: Generated accessors for eventRaces
extension EventEntity {

    @objc(addEventRacesObject:)
    @NSManaged public func addToEventRaces(_ value: RaceEntity)

    @objc(removeEventRacesObject:)
    @NSManaged public func removeFromEventRaces(_ value: RaceEntity)

    @objc(addEventRaces:)
    @NSManaged public func addToEventRaces(_ values: NSSet)

    @objc(removeEventRaces:)
    @NSManaged public func removeFromEventRaces(_ values: NSSet)

}

extension EventEntity : Identifiable {

}
