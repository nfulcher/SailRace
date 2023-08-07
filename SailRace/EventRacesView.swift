//
//  EventRacesView.swift
//  SailRace
//
//  Created by Neil Fulcher on 06/08/2023.
//

import CoreData
import SwiftUI


struct EventRacesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: []) var events: FetchedResults<EventEntity>
    
    var body: some View {
        VStack {
            List {
                ForEach(events, id: \.self) { event in
                    Section(event.wrappedEventName) {
                        ForEach(event.racesArray, id: \.self) { race in
                            HStack {
                                Text("Race No.: ")
                                Text(String(race.wrappedRaceNumber))
                                Spacer()
                                Text("Place: ")
                                Text(race.wrappedPlacing)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct EventRacesView_Previews: PreviewProvider {
    static var previews: some View {
        EventRacesView()
    }
}
