//
//  PhotoSizes+CoreData.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import CoreData

// MARK: - CoreDataPersistable
extension PhotoSizes: CoreDataPersistable {
  var keyMap: [PartialKeyPath<PhotoSizes>: String] {
    [
      \.small: "small",
      \.medium: "medium",
      \.large: "large",
      \.full: "full",
      \.id: "id"
    ]
  }

  typealias ManagedType = PhotoSizesEntity
}
