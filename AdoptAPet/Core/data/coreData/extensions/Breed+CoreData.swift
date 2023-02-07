//
//  Breed+CoreData.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

// MARK: - CoreDataPersistable
extension Breed: CoreDataPersistable {
  var keyMap: [PartialKeyPath<Breed>: String] {
    [
      \.primary: "primary",
      \.secondary: "secondary",
      \.mixed: "mixed",
      \.unknown: "unknown",
      \.id: "id"
    ]
  }

  typealias ManagedType = BreedEntity
}
