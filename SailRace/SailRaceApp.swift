//
//  SailRaceApp.swift
//  SailRace
//
//  Created by Neil Fulcher on 22/06/2023.
//

import SwiftUI

@main
struct SailRaceApp: App {
    
 // Reinstate the codd below after playing with the CoreDataRelationship file
//  let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
 // Reinstate HomeView() too
//                HomeView()
            
   // Also this line...
  //         .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
     // Reinstate this
       
     CoreDataRelationships()
        }
    }
}
