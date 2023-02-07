//
//  AnimalStoreService.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import Foundation
import CoreData

actor AnimalStoreService {
  private let context: NSManagedObjectContext

  init(context: NSManagedObjectContext) {
    self.context = context
  }
}

// MARK: - AnimalStore
extension AnimalStoreService: AnimalStore {
  func save(animals: [Animal]) async throws {
    for var animal in animals {
      animal.toManagedObject(context: context)
    }
    try context.save()
  }
}
