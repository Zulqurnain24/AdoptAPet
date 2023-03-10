//
//  Persistence.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import CoreData

struct PersistenceController {
  static let shared = PersistenceController()

  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for i in 0..<10 {
      var animal = Animal.mock[i]
      animal.toManagedObject(context: viewContext)
    }
    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()

  let container: NSPersistentContainer

  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "AdoptAPet")
    if inMemory {
      container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    container.viewContext.automaticallyMergesChangesFromParent = true
  }

  static func save() {
    let context =
    PersistenceController.shared.container.viewContext
    guard context.hasChanges else { return }

    do {
      try context.save()
    } catch {
      fatalError("""
        \(#file), \
        \(#function), \
        \(error.localizedDescription)
      """)
    }
  }
}
