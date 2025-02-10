//
//  SwiftUIDay01App.swift
//  SwiftUIDay01
//
//  Created by 김도연 on 2/10/25.
//

import SwiftUI

@main
struct SwiftUIDay01App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
