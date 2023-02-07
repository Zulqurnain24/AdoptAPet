//
//  APIColors+CoreData.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import CoreData

// MARK: - CoreDataPersistable
extension APIColors: CoreDataPersistable {
  var keyMap: [PartialKeyPath<APIColors>: String] {
    [
      \.primary: "primary",
      \.secondary: "secondary",
      \.tertiary: "tertiary"
    ]
  }

  typealias ManagedType = APIColorsEntity
}
