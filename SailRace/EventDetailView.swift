//
//  EventDetailView.swift
//  SailRace
//
//  Created by Neil Fulcher on 05/07/2023.
//

import SwiftUI
import CoreData

struct EventDetailView: View {
    
    // Fetch events in
    
    
    
    // Paul Hudson Tutorial 6/7
    @FetchRequest var fetchRequest: FetchedResults<EventEntity>
    
    // Needed for SkipperAllocatedView Code
    @FetchRequest(sortDescriptors: []) var events: FetchedResults<EventEntity>
    
    // Needed for SkipperAvailableView code
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var skippers: FetchedResults<SkipperEntity>
    
    @Environment(\.managedObjectContext) private var viewContext
    
 // Original
//    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], predicate: NSPredicate(format: "name == 'Whittlingham'")) var events: FetchedResults<EventEntity>
    
  // Test FetchRequest
//    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], predicate: NSPredicate(format: "name = %@", "Whittlingham")) var events: FetchedResults<EventEntity>
    
    var body: some View {
        
        VStack  {
            
            // Paul Hudson tutorial
            
            List(fetchRequest, id: \.self) { event in
                HStack {
                    //  Text("\(event.wrappedName)")
                    Text(event.name ?? "")
                    Spacer()
                    Text(event.date?.eventDisplayFormat ?? "")
                }
                //   SkipperAllocatedView()
                // List the skippers that are participating in the event
                Section("Competitors") {
                    // Brought list up from allocatedview code below
                  
                        ForEach(event.competitorArray, id: \.self) { skipper in
                            HStack {
                                Text(skipper.wrappedName)
                                Spacer()
                                Text(skipper.wrappedBoatNumber)
                            }
                        }
                    }
                }
            
        
         //   SkipperAvailableView()
            // List the skippers all skippers in ythe list (later we'll filter these to show those so far not participating)
            
            VStack (alignment: .leading) {
                Section("Available Skippers") {
                    List(fetchRequest, id: \.self) { event in
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
                    .listStyle(PlainListStyle())
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
