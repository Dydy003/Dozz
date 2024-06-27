//
//  Persistence.swift
//  Dozz
//
//  Created by Dylan Caetano on 26/06/2024.
//

import CoreData

struct PersistenceController {
    
    // MARK: -1. CONTRÔLEUR PERMANENT
    static let shared = PersistenceController()

    // MARK: -2. CONTENEUR PERSISTANT
    let container: NSPersistentContainer

    // MARK: -3. INITIALISATION (chargement de la mémoire permanente)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Dozz")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // MARK: -4. PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<3 {
            let newTask = Task(context: viewContext)
            newTask.timestamp = Date()
            newTask.task = "Sample task No\(i)"
            newTask.completion = false
            newTask.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
