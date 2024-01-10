//
//  DJournalApp.swift
//  DJournal
//
//  Created by Rehnuma Reza Deepty on 7/6/23.
//

import SwiftUI

@main
struct DJournalApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
