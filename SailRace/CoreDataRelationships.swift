//
//  CoreDataRelationships.swift
//  SailRace
//
//  Created by Neil Fulcher on 21/07/2023.
//

import SwiftUI
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager() // Singleton
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "SailRace")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved successfully!")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}

class CoreDataRElationshipViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var skippers: [SkipperEntity] = []
    @Published var events: [EventEntity] = []
    @Published var races: [RaceEntity] = []
    
    init() {
        getSkippers()
        getEvents()
        getRaces()
    }
    
    func getSkippers() {
        let request = NSFetchRequest<SkipperEntity>(entityName: "SkipperEntity")
        
        do {
            skippers = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getEvents() {
        let request = NSFetchRequest<EventEntity>(entityName: "EventEntity")
        
        do {
            events = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getRaces() {
        let request = NSFetchRequest<RaceEntity>(entityName: "RaceEntity")
        
        do {
            races = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func addSkipper() {
        let newSkipper = SkipperEntity(context: manager.context)
        newSkipper.name = "Pugwash"
        
        // add new skipper to existing event
        //newSkipper.addToEvent(EventEntity)
        
        // add new skipper to existing races
        //newSkipper.addToRaces(RaceEntity)
        
        save()
    }
    
    func addEvent() {
        let newEvent = EventEntity(context: manager.context)
        newEvent.name = "Japan"
        newEvent.date = Date()
        newEvent.competitors = [skippers[2]]
        save()
    }
    
    func addRace() {
        let newRace = RaceEntity(context: manager.context)
        newRace.event = [events[0]]
        newRace.racers = [skippers[2]]
        newRace.placing = "6"
        newRace.raceNumber = 8
        save()
    }

    func save() {
        skippers.removeAll()
        events.removeAll()
        races.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getSkippers()
            self.getEvents()
            self.getRaces()
        }
    }
}

struct CoreDataRelationships: View {
    
    @StateObject var vm = CoreDataRElationshipViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 20) {
                    Button {
                        vm.addRace()
                    } label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    }
                    
                    // View the Skippers Data (SkipView)
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.skippers) { skipper in
                                SkipView(entity: skipper)
                            }
                        }
                    })
                    // View the Regattas Data (Events in RegattaView)
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
                            ForEach(vm.events) { event in
                                RegattaView(entity: event)
                            }
                        }
                    })
                    
                    // View the Races Data (Races in RacesView)
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(alignment: .top) {
//                            ForEach(vm.races) { duel in
//                                RacesView(entity: duel)
                            }
             //           }
                    })
                    
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
    
    struct CoreDataRelationships_Previews: PreviewProvider {
        static var previews: some View {
            CoreDataRelationships()
        }
    }
    
    struct SkipView: View {
        
        let entity: SkipperEntity
        
        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("Name: \(entity.name ?? "")")
                    .bold()
                
                if let events = entity.event?.allObjects as? [EventEntity] {
                    Text("Events:")
                        .bold()
                    ForEach(events) { event in
                        HStack {
                            Text(event.name ?? "")
                            Spacer()
                            Text(event.date?.eventDisplayFormat ?? "")
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: 300, alignment: .leading)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
            .shadow(radius: 3)
        }
    }
    
    struct RegattaView: View {
        
        let entity: EventEntity
        
        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("Name: \(entity.name ?? "")")
                    .bold()
                Text("Date: \(entity.date?.eventDisplayFormat ?? "")")
                
                
                if let events = entity.competitors?.allObjects as? [EventEntity] {
                    Text("Events:")
                        .bold()
                    Text("Date")
                    ForEach(events) { event in
                        HStack {
                            Text(event.name ?? "")
                            Spacer()
                            Text(event.date?.eventDisplayFormat ?? "")
                        }
                    }
                }
                
                if let events = entity.competitors?.allObjects as? [SkipperEntity] {
                    Text("Skippers:")
                        .bold()
                    
                    ForEach(events) { event in
                        HStack {
                            Text(event.name ?? "")
                            Spacer()
                            Text(event.boatNumber ?? "")
                        }
                    }
                }
                
            }
            .padding()
            .frame(maxWidth: 300, alignment: .leading)
            .background(Color.green.opacity(0.5))
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
    
    struct RacesView: View {
        
        let entity: EventEntity
        
        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("Races:")
                
                
//                Text("Name: \(entity.name ?? "")")
//                    .bold()
//                Text("Date: \(entity.date?.eventDisplayFormat ?? "")")
//                
//                
//                if let eventRaces = entity.event?.allObjects as? [RaceEntity] {
//                    Text("Event Races:")
//                        .bold()
//                    ForEach(eventRaces) { eventRace in
//                        Text(String(eventRace.raceNumber))
//                    }
//                }
                
                if let raceSkippers = entity.competitors?.allObjects as? [SkipperEntity] {
                    Text("Skippers")
                        .bold()
                    ForEach(raceSkippers) { raceSkipper in
                        Text(raceSkipper.boatNumber ?? "")
                        
                    }
                }
            }
            .padding()
            .frame(maxWidth: 300, alignment: .leading)
            .background(Color.orange.opacity(0.5))
            .cornerRadius(10)
            .shadow(radius: 3)
        }
    }
}

