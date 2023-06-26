//
//  ContentView.swift
//  SailRace
//
//  Created by Neil Fulcher on 22/06/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

    @FetchRequest(sortDescriptors: []) var skippers: FetchedResults<SkipperEntity>
    
    var body: some View {
        
        VStack {
            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
            List {
                ForEach(skippers) {skipper in
                    
                    HStack {
                        Text(skipper.name ?? "No name")
                            .onTapGesture {
                                skipper.name = "Neil"
                                try! viewContext.save()
                            }
                        Spacer()
                        Text(skipper.boatNumber ?? "No boat number")
                            .onTapGesture {
                                viewContext.delete(skipper)
                                try! viewContext.save()

//                                skipper.boatNumber = "01"
//                                try! viewContext.save()
                            }
                    }
                }
            }
        }
        
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
    }

    private func addItem() {
        
        let s = SkipperEntity(context: viewContext)
        s.name = "Trevor"
        s.boatNumber = "31"
     
            do {
               try viewContext.save()
            }
        catch {
            // Error with string
        }
        
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
