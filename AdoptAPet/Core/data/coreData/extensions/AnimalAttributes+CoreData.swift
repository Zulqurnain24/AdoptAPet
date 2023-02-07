//
//  AnimalAttributes+CoreData.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import CoreData

// MARK: - CoreDataPersistable
extension AnimalAttributes: CoreDataPersistable {
  var keyMap: [PartialKeyPath<AnimalAttributes>: String] {
    [
      \.spayedNeutered: "spayedNeutered",
      \.houseTrained: "houseTrained",
      \.declawed: "declawed",
      \.specialNeeds: "specialNeeds",
      \.shotsCurrent: "shotsCurrent",
      \.id: "id"
    ]
  }

  typealias ManagedType = AnimalAttributesEntity
}
