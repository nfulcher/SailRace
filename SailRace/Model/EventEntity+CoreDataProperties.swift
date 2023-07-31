//
//  EventEntity+CoreDataProperties.swift
//  SailRace
//
//  Created by Neil Fulcher on 30/07/2023.
//
//

import Foundation
import CoreData


extension EventEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventEntity> {
        return NSFetchRequest<EventEntity>(entityName: "EventEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var eventID: UUID?
    @NSManaged public var name: String?
    @NSManaged public var competitors: NSSet?
    @NSManaged public var races: NSSet?
    
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
    
    // Added these variables to assist filtering fetch request = Core Data Swift 6/7 Paul Hudson
//    var  wrappedName: String {
//        name ?? "Unknown"
//    }

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
