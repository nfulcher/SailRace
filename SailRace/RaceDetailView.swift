//
//  RaceDetailView.swift
//  SailRace
//
//  Created by Neil Fulcher on 31/07/2023.
//

import SwiftUI
import CoreData

struct RaceDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Paul Hudson Tutorial 6/7
  //  @FetchRequest var fetchRequest: FetchedResults<EventEntity>
    
    // Needed for SkipperAvailableView code
 //   @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var skippers: FetchedResults<SkipperEntity>
    
    // Needed for Races code
 //   @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "raceNumber", ascending: true)]) var eventRaces: FetchedResults<RaceEntity>
    
    var event: EventEntity // The selected event passed from the parent view
    
   
 
    var body: some View {
      
        VStack  {
                // Display selected Event detail
    //            List(fetchRequest, id: \.self) { event in
                    Section("Event") {
                        HStack {
                            Text(event.wrappedEventName)
                            Spacer()
                            Text(event.wrappedEventDate.eventDisplayFormat)
                        }
                    }
                    
//            ForEach(event.racesArray, id: \.self) { race in
//                HStack {
//                    Text("Race No: ")
//                    Text(String(race.wrappedRaceNumber))
//
//                    Text("Skippers: ")
//                    if let racers = race.racers.allObjects as? [SkipperEntity] {
//                        ForEach(race.racersArray, id: \.self) { skipper in
//                            Text(skipper.name ?? "")
//                            Text(skipper.boatNumber ?? "")
//                        }
//
//                    }
//
//
//                    Spacer()
//
//                    Text("Place: ")
//                    Text(race.wrappedPlacing)
//                }
//            }

            
            
            // Fetch races and filter based on the selected event's date
//                       Section("Event races") {
//                           FetchRequest<RaceEntity>(
//                               sortDescriptors: [NSSortDescriptor(key: "raceNumber", ascending: true)],
//                               predicate: NSPredicate(format: "eventName == %@", event.wrappedEventName)
//                           ) { races in
//                               ForEach(races, id: \.self) { race in
//                                   HStack {
//                                       Text("Race No: \(race.wrappedRaceNumber)")
//                                       Text("Boat No: \(race.racers?.name ?? "")") // Assumes you have the 'racers' relationship in RaceEntity
//                                       Spacer()
//                                       Text("Place: \(race.wrappedPlacing)")
//                                   }
//                               }
//                           }
//                       }
//
                    
//                    Section("Event races") {
//                        ForEach(event.racesArray, id: \.self) {race in
//
//                            HStack {
//                                Text("Race No: ")
//                                Text(String(race.wrappedRaceNumber))
//
//                                Text("Boat No: ")
//                                //           Text(skippers.boatNumber)
//
//                                Spacer()
//
//                                Text("Place: ")
//                                Text(race.wrappedPlacing)
//                            }
//                        }
//                    }
                    
            // Show a list of available Skippers (originally from SkipperAvailableView)
            // Later we'll filter these to show those so far not participating)
//                    Section("Available Skippers") {
//                        ForEach(skippers) { skipper in
//                            HStack {
//                                Text(skipper.name ?? "No Name")
//                                    .onTapGesture {
//                                        event.addToCompetitors(skipper)
//                                        try! viewContext.save()
//                                    }
//                                Spacer()
//                                Text(skipper.boatNumber ?? "No boat number")
//                            }
//                        }
//                    }
          //      }
            }
        
        }
    
    // Paul Hudson Tutorial 6/7
//    init(filter: Date) {
//        _fetchRequest = FetchRequest<EventEntity>(sortDescriptors: [], predicate: NSPredicate(format: "date = %@", filter as CVarArg))
//    }
}
