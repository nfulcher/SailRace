//
//  RaceView.swift
//  SailRace
//
//  Created by Neil Fulcher on 04/07/2023.
//

import SwiftUI
import CoreData

struct RaceView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
    // Needed for SkipperAllocatedView Code
        @FetchRequest(sortDescriptors: []) var events: FetchedResults<EventEntity>
    
    // Add EventEntity fetch
 //   @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var event: FetchedResults<EventEntity>
    
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "raceNumber", ascending: true)]) var races: FetchedResults<RaceEntity>
    
    var body: some View {
        
        VStack {
            Button(action: addRace) {
                Label("Add Race", systemImage: "plus")
            }
            
            HStack {
                //      Text($event.wrappedEventName)
                //             Text("Event:")
                //           Spacer()
                //         Text(event.wrappedEventDate.eventDisplayFormat)
                //   Text(event.date?.eventDisplayFormat ?? "")
            }
            
            
            List {
                
                let thisEvent = events[0]
                
                //ForEach(events[0]) { event in
                HStack {
                    Text("Event Name: ")
                    Text(thisEvent.name ?? "")
                    Spacer()
                    Text("Date: ")
                    Text(thisEvent.date?.eventDisplayFormat ?? "")
                    //     Text(String(thisEvent.date))
                }
                    
                    ForEach(races) {race in
                        
                        HStack{
                            Text("Race No:")
                            Text(String(race.raceNumber))
                            //                            .onTapGesture {
                            //                                race.raceNumber = 9
                            //                                try! viewContext.save()
                            //                            }
                                                        .onLongPressGesture {
                                                            // Delete
                                                            viewContext.delete(race)
                                                            try! viewContext.save()
                                                        }
                            Spacer()
                            Text("Boat No:")
                            Text("24")
                            
                            
                            Spacer()
                            Text("Place:")
                            Text(race.placing ?? "")
                            //                            .onTapGesture {
                            //                                race.placing = "2nd"
                            //                                try! viewContext.save()
                            //                            }
                        }
                    }
                }
            }
        }
//    }
    
    private func addRace() {
        let e = RaceEntity(context: viewContext)
   //     e.name = "Race 1"
   //     e.eventName = "Summer Series"
    //    e.event = [4]
        e.raceNumber = 6
//        e.addToEvent = 2
        e.placing = "1st"
        
        do {
            try viewContext.save()
        }
        catch {
            // Error with string
        }
    }
}


struct RaceView_Previews: PreviewProvider {
    static var previews: some View {
        RaceView()
    }
}
