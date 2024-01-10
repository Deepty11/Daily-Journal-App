//
//  PersistenceController.swift
//  DJournal
//
//  Created by Rehnuma Reza(Deepty) on 10/1/24.
//

import UIKit
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    static var preview: PersistenceController {
        let controller = PersistenceController(inMemory: true)
        
        for _ in 0..<10 {
            let message = MessageEntity(context: controller.container.viewContext)
            message.id = UUID().uuidString
            message.text = "Hi! I am Deepty"
            message.date = Date().format(with: "YYYY-MM-dd hh:mm")
        }
        
        return controller
    }
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Main")
        
        if inMemory {
            if #available(iOS 16.0, *) {
                container.persistentStoreDescriptions.first?.url = URL(filePath: "/dev/null")
            } else {
                container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
            }
        }
        
        container.loadPersistentStores { description, error in
            if let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
