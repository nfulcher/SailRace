//
//  SkipperView.swift
//  SailRace
//
//  Created by Neil Fulcher on 22/06/2023.
//

import SwiftUI
import CoreData

struct SkipperView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var skipperName = ""
    @State private var boatNumber = ""
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "boatNumber", ascending: true)]) var skippers: FetchedResults<SkipperEntity>
    
    var body: some View {
        
        
        VStack (alignment: .leading) {
            
            Form {
                Section("Add New Skipper") {
                    TextField("Enter Skipper Name", text: $skipperName)
                    TextField("Enter Boat Number", text: $boatNumber)
                    
                    Button {
                        addSkipper()
                    } label: {
                        Text("Add Skipper")
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
            }
            
            List {
                Section("Skippers") {
                    ForEach(skippers) { skipper in
                        
                        HStack {
                            Text(skipper.name ?? "No name")
                            
                            Spacer()
                            Text(skipper.boatNumber ?? "No boat number")
                        }
                    }
                    .onDelete(perform: removeSkipper)
                }
                .listStyle(PlainListStyle())
            }
        }
    }
    
    func removeSkipper(at offsets: IndexSet) {
        for index in offsets {
            let skipper = skippers[index]
            viewContext.delete(skipper)
            
            do {
                try viewContext.save()
            }
            catch {
                // Error with string
            }
        }
    }
    
    private func addSkipper() {
        let s = SkipperEntity(context: viewContext)
        s.name = skipperName
        s.boatNumber = boatNumber
        
        do {
            try viewContext.save()
        }
        catch {
            // Error with string
        }
        skipperName = ""
        boatNumber = ""
    }
    
    private func addItem() {
        withAnimation {
            let s = SkipperEntity(context: viewContext)
            s.name = "Trevor"
            s.boatNumber = String(Int.random(in: 0...99))
            
            do {
                try viewContext.save()
            }
            catch {
                // Error with string
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct SkipperView_Previews: PreviewProvider {
    static var previews: some View {
        SkipperView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
