//
//  InsightmentApp.swift
//  Insightment
//
//  Created by Jason Kenneth on 22/07/22.
//

import SwiftUI

@main
struct InsightmentApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
