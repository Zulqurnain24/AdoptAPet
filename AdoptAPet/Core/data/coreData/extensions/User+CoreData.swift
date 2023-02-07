//
//  User+CoreData.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import CoreData

// MARK: - CoreDataPersistable
extension User: CoreDataPersistable {
  var keyMap: [PartialKeyPath<User>: String] {
    [
      \.name: "name",
      \.password: "password",
      \.extra: "extra",
      \.id: "id"
    ]
  }
  typealias ManagedType = UserEntity
}
