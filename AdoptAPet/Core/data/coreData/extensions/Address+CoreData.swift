//
//  Address+CoreData.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import CoreData

// MARK: - CoreDataPersistable
extension Address: CoreDataPersistable {
  var keyMap: [PartialKeyPath<Address>: String] {
    [
      \.address1: "address1",
      \.address2: "address2",
      \.city: "city",
      \.state: "state",
      \.postcode: "postcode",
      \.country: "country",
      \.id: "id"
    ]
  }

  typealias ManagedType = AddressEntity
}
