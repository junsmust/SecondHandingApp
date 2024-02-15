//
//  SecondHandAppApp.swift
//  SecondHandApp
//
//  Created by 임주영 on 2024/02/15.
//

import SwiftUI

@main
struct SecondHandAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
