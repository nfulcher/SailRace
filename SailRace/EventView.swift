//
//  EventView.swift
//  SailRace
//
//  Created by Neil Fulcher on 29/06/2023.
//

import SwiftUI
import CoreData

struct EventView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var events: FetchedResults<EventEntity>
    
    var body: some View {
        
        VStack {
            Button(action: addEvent) {
                Label("Add Event", systemImage: "plus")
            }
            List {
                ForEach(events) {event in
                    
                    HStack{
                        Text(event.name ?? "")
                            .onTapGesture {
                                event.name = "Whittlingham"
                                try! viewContext.save()
                            }
                            .onLongPressGesture {
                                // Delete
                                viewContext.delete(event)
                                try! viewContext.save()
                            }
                        
                        Spacer()
                        
                       Text(event.date?.displayFormat ?? "")
                 
                            .onTapGesture {
                                
                                // Update
                                let input = "31/08/2023"
                                let formatter = DateFormatter()
                                formatter.dateFormat = "dd/MM/yyyy"
                                if let date = formatter.date(from: input) {
                                    event.date = date
                                }
                                
                                try! viewContext.save()
                            }
                        
                            .onLongPressGesture {
                                // Delete
                                viewContext.delete(event)
                                try! viewContext.save()
                            }
                    }
                }
            }
        }
    }
    
    private func addEvent() {
        let e = EventEntity(context: viewContext)
        e.name = "Eaton Park"
        e.date = Date()
        
        do {
            try viewContext.save()
        }
        catch {
            // Error with string
        }
    }
}

extension Date {
    var displayFormat: String {
        self.formatted(date: .abbreviated, time: .shortened)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()


struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
