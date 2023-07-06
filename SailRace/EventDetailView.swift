//
//  EventDetailView.swift
//  SailRace
//
//  Created by Neil Fulcher on 05/07/2023.
//

import SwiftUI

struct EventDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
  
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], predicate: NSPredicate(format: "name == 'Whittlingham'")) var events: FetchedResults<EventEntity>
    
// original    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var events: FetchedResults<EventEntity>
    
//  from recipe app  @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)], predicate: NSPredicate(format: "featured == true")) var recipes: FetchedResults<Recipe>
    
    var body: some View {
        
        
        VStack  {

            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            List {
                ForEach(events) {event in
                    
                    HStack{
                        
                        Text(event.name ?? "")
                        
                        Spacer()
                        
                        Text(event.date?.displayFormat ?? "")
                    }
                }
            }
            
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
