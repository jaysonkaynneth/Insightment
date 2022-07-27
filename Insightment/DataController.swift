//
//  DataController.swift
//  Insightment
//
//  Created by Jason Kenneth on 27/07/22.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Insightment")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

