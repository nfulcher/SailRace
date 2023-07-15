//
//  SkipperAvailableView.swift
//  SailRace
//
//  Created by Neil Fulcher on 14/07/2023.
//

import SwiftUI
import CoreData

struct SkipperAvailableView: View {

    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var skippers: FetchedResults<SkipperEntity>

    var body: some View {
        
        VStack (alignment: .leading) {
            Section("Available Skippers") {
                List {
                    ForEach(skippers) { skipper in
                        HStack {
                            Text(skipper.name ?? "No Name")
                                .onTapGesture {
                                    allocateSkipperToEvent()
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
    

    
    func allocateSkipperToEvent() {
     
        // Create an event
        let event = EventEntity(context: viewContext)
        
        event.name = "Fleetwood"
        event.date = Date()
        
        // Create competitor
        let skipper = SkipperEntity(context: viewContext)
        skipper.name = "Winston Churchill"
        skipper.boatNumber = "99"
        
        // Add skipper to event
        event.addToCompetitors(skipper)
        
        // Save context
        try! viewContext.save()
        
        
       // EventEntity(entity: SkipperEntity, insertInto: viewContext).addToCompetitors(self)
 
    }
}

struct SkipperAvailableView_Previews: PreviewProvider {
    static var previews: some View {
        SkipperAvailableView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
