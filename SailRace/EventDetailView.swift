//
//  EventDetailView.swift
//  SailRace
//
//  Created by Neil Fulcher on 05/07/2023.
//

import SwiftUI
import CoreData

struct EventDetailView: View {
    
    // Paul Hudson Tutorial 6/7
    @FetchRequest var fetchRequest: FetchedResults<EventEntity>
    
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
            }
            SkipperAvailableView()
        }
    }
    
    // Paul Hudson Tutorial 6/7
    init(filter: Date) {
        _fetchRequest = FetchRequest<EventEntity>(sortDescriptors: [], predicate:
                                                    NSPredicate(format: "date = %@", filter as CVarArg))
        //     NSPredicate(format: "name = %@ AND date > %@", filter, Date() as CVarArg))
        
        
    }
}

//struct EventDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventDetailView()
//    }
//}
