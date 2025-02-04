//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 황준성 on 1/13/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
