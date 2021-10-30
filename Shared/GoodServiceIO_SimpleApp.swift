//
//  GoodServiceIO_SimpleApp.swift
//  Shared
//
//  Created by Christopher Sanders on 10/30/21.
//

import SwiftUI

@main
struct GoodServiceIO_SimpleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
