//
//  EventDetailView.swift
//  SailRace
//
//  Created by Neil Fulcher on 05/07/2023.
//

import SwiftUI
import CoreData

struct EventDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Paul Hudson Tutorial 6/7
    @FetchRequest var fetchRequest: FetchedResults<EventEntity>
    
    // Needed for SkipperAllocatedView Code
    //    @FetchRequest(sortDescriptors: []) var events: FetchedResults<EventEntity>
    
    // Needed for SkipperAvailableView code
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var skippers: FetchedResults<SkipperEntity>
 
    var body: some View {
      
        VStack  {
                // Display selected Event detail
                List(fetchRequest, id: \.self) { event in
                    Section("Event") {
                        HStack {
                            Text(event.wrappedEventName)
                            //   Text(event.name ?? "")
                            Spacer()
                            Text(event.wrappedEventDate.eventDisplayFormat)
                            //   Text(event.date?.eventDisplayFormat ?? "")
                        }
                    }
                    // List the competitors allocated to the selected event (originally from SkipperAllocatedView)
                    Section("Competitors") {
                        ForEach(event.competitorArray, id: \.self) { skipper in
                            HStack {
                                Text(skipper.wrappedName)
                                    .onTapGesture {
                                        event.removeFromCompetitors(skipper)
                                        try! viewContext.save()
                                    }
                                Spacer()
                                Text(skipper.wrappedBoatNumber)
                            }
                        }
                    }
            // Show a list of available Skippers (originally from SkipperAvailableView)
            // Later we'll filter these to show those so far not participating)
                    Section("Available Skippers") {
                        ForEach(skippers) { skipper in
                            HStack {
                                Text(skipper.name ?? "No Name")
                                    .onTapGesture {
                                        event.addToCompetitors(skipper)
                                        try! viewContext.save()
                                    }
                                Spacer()
                                Text(skipper.boatNumber ?? "No boat number")
                            }
                        }
                    }
                }
            }
        
        }
    
    // Paul Hudson Tutorial 6/7
    init(filter: Date) {
        _fetchRequest = FetchRequest<EventEntity>(sortDescriptors: [], predicate: NSPredicate(format: "date = %@", filter as CVarArg))
    }
}


func allocateSkipperToEvent() {
    
    //    // Create an event
    //    let event = EventEntity(context: viewContext)
    //
    //    event.name = "Fleetwood"
    //    event.date = Date()
    //
    //    // Create competitor
    //    let skipper = SkipperView(skippers: FetchRequest<SkipperEntity>)
    //    let skipper = SkipperEntity(context: viewContext)
    //    skipper.name = "Winston Churchill"
    //    skipper.boatNumber = "99"
    //
    //    // Add skipper to event
    //   event.addToCompetitors(skipper)
    //
    //    // Save context
    //    try! viewContext.save()
    //
    //
    //   // EventEntity(entity: SkipperEntity, insertInto: viewContext).addToCompetitors(self)
    
}


//struct EventDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventDetailView()
//    }
//}
