//
//  finalApp.swift
//  final
//
//  Created by Ayham on 2021-11-29.
//

import SwiftUI

@main
struct finalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
