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
    
    @State private var eventName = ""
    @State private var eventDate = Date()

    @State private var eventID = UUID()
    
    @FetchRequest(sortDescriptors: []) var events: FetchedResults<EventEntity>
    var body: some View {
        
        NavigationStack {
            VStack (alignment: .leading) {
                
                Section("New Event") {
                    Form {
                        TextField("Enter Event Name", text: $eventName)
                        DatePicker("Date/Time", selection: $eventDate)
                            .datePickerStyle(DefaultDatePickerStyle())
                        
                        Button {
                            addEvent()
                        } label: {
                            Text("Add Event")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                   
                }
              
                Section("Existing Events") {
                    List {
                        ForEach(events) { event in
                         NavigationLink(destination: EventDetailView(filter: event.date ?? Date())) {
                                HStack {
                                    Text(event.name ?? "")
                                    Spacer()
                                    Text(event.date?.eventDisplayFormat ?? "")
                                }
                            }
                        }
                        .onDelete(perform: removeEvent)
                    }
                    .listStyle(PlainListStyle())
                }
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
    
    private func addEvent() {
        let e = EventEntity(context: viewContext)
        e.name = eventName
        e.date = eventDate
        
        do {
            try viewContext.save()
        }
        catch {
            // Error with string
        }
    }
    
    // Paul Hudsons demo for working with Core Data relationships
    func relationshipDemo() {
        
        // Create an event
        let event = EventEntity(context: viewContext)
        event.name = "Fleetwood"
        
        // Create competitor
        var skipper = SkipperEntity(context: viewContext)
        skipper.name = "Tony Cater"
        
        // Add skipper to event
        event.addToCompetitors(skipper)
        
        // Save context
        try! viewContext.save()
        
    }
}

extension Date {
    var displayFormat: String {
        self.formatted(date: .abbreviated, time: .standard)
    }
    var eventDisplayFormat: String {
        self.formatted(
            .dateTime.locale(Locale.current)
            .hour(.defaultDigits(amPM: .omitted))
            .minute(.twoDigits)
            .day(.twoDigits)
            .month(.twoDigits)
            .year(.twoDigits)
           
            
        )
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
