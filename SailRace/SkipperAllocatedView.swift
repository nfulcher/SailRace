//
//  SkipperAllocatedView.swift
//  SailRace
//
//  Created by Neil Fulcher on 15/07/2023.
//

import SwiftUI
import CoreData

struct SkipperAllocatedView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: []) var events: FetchedResults<EventEntity>
    
    var body: some View {
        
        VStack {
            List {
                ForEach(events, id: \.self) { event in
                    Section(header: Text("\(event.wrappedEventName) :: \(event.wrappedEventDate.eventDisplayFormat)")) {

                            ForEach(event.competitorArray, id: \.self) { skipper in
                                HStack {
                                    Text(skipper.wrappedName)
                                    Spacer()
                                    Text(skipper.wrappedBoatNumber)
                                }
                            }
                        }
                    }
                
                .onDelete(perform: removeEvent)
                
//                Button("Add Examples") {
//                    let skipper1 = SkipperEntity(context: viewContext)
//                    skipper1.name = "John Blythe"
//                    skipper1.boatNumber = "24"
                //    skipper1.event = [EventEntity(context: viewContext)]
                //    skipper1.event = ["Rutland Water"]
             //       skipper1.event?.name = "Rutland Water"
//
//                    let skipper2 = SkipperEntity(context: viewContext)
//                    skipper2.name = "Dave Ditton"
//                    skipper2.boatNumber = "46"
//                    skipper2.event = EventEntity(context: viewContext)
//                    skipper2.event?.name = "Rutland Water"
//
//                    let skipper3 = SkipperEntity(context: viewContext)
//                    skipper3.name = "Colin Camo"
//                    skipper3.boatNumber = "19"
//                    skipper3.event = EventEntity(context: viewContext)
//                    skipper3.event?.name = "Breydon Water"
//
//                    let skipper4 = SkipperEntity(context: viewContext)
//                    skipper4.name = "Brian Jacob"
//                    skipper4.boatNumber = "144"
//                    skipper4.event = EventEntity(context: viewContext)
//                    skipper4.event?.name = "Filby Broad"
//
//                    try? viewContext.save()
//
//                }
            }
        }
    }
    
    
    
    func removeEvent(at offsets: IndexSet) {
        for index in offsets {
            let event = events[index]
            viewContext.delete(event)
            
            do {
                try viewContext.save()
            }
            catch {
                // Error with string
            }
        }
    }
}

struct SkipperAllocatedView_Previews: PreviewProvider {
    static var previews: some View {
        SkipperAllocatedView()
    }
}
