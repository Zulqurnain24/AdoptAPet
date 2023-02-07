//
//  AnimalEnvironment+CoreData.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import CoreData

// MARK: - CoreDataPersistable
extension AnimalEnvironment: CoreDataPersistable {
  var keyMap: [PartialKeyPath<AnimalEnvironment>: String] {
    [
      \.children: "children",
      \.dogs: "dogs",
      \.cats: "cats",
      \.id: "id"
    ]
  }

  typealias ManagedType = AnimalEnvironmentEntity
}
