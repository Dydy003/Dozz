//
//  Persistence.swift
//  Dozz
//
//  Created by Dylan Caetano on 26/06/2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Dozz")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
        static var preview: PersistenceController = {
            let result = PersistenceController(inMemory: true)
            let viewContext = result.container.viewContext
            for i in 0..<1 {
                let newTask = Task(context: viewContext)
                newTask.timestamp = Date()
                newTask.task = "Liste \(i)"
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









//    static var preview: PersistenceController = {
//        let result = PersistenceController(inMemory: true)
//        let viewContext = result.container.viewContext
//        for i in 0..<1 {
//            let newTask = Task(context: viewContext)
//            newTask.timestamp = Date()
//            newTask.task = "Sample task No\(i)"
//            newTask.completion = false
//            newTask.id = UUID()
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        return result
//    }()

