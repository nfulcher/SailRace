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
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var races: FetchedResults<RaceEntity>
    
    var body: some View {
        
        VStack {
            Button(action: addRace) {
                Label("Add Race", systemImage: "plus")
            }
            List {
                ForEach(races) {race in
                    
                    HStack{
                        Text(race.name ?? "")
                            .onTapGesture {
                                race.name = "Race 8"
                                try! viewContext.save()
                            }
                            .onLongPressGesture {
                                // Delete
                                viewContext.delete(race)
                                try! viewContext.save()
                            }
                        
                        Spacer()
                        
                        Text(race.eventName ?? "")
                            .onTapGesture {
                                race.eventName = "Winter Series"
                                try! viewContext.save()
                            }
                        
                        Spacer()
                        
                        Text(String(race.raceNumber))
                            .onTapGesture {
                                race.raceNumber = 7
                                try! viewContext.save()
                            }
                        Spacer()
                        
                        Text(race.placing ?? "")
                            .onTapGesture {
                                race.placing = "2nd"
                                try! viewContext.save()
                            }
                    }
                }
            }
        }
    }
    
    private func addRace() {
        let e = RaceEntity(context: viewContext)
        e.name = "Race 1"
        e.eventName = "Summer Series"
        e.raceNumber = 3
        e.placing = "DNF"
        
        do {
            try viewContext.save()
        }
        catch {
            // Error with string
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct RaceView_Previews: PreviewProvider {
    static var previews: some View {
        RaceView()
    }
}
