//
//  AnimalSearcherMock.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import Foundation

struct AnimalSearcherMock: AnimalSearcher {
  func searchAnimal(
    by text: String,
    age: AnimalSearchAge,
    type: AnimalSearchType
  ) async -> [Animal] {
    var animals = Animal.mock
    if age != .none {
      animals = animals.filter {
        $0.age.rawValue.lowercased() == age.rawValue.lowercased()
      }
    }
    if type != .none {
      animals = animals.filter {
        $0.type.lowercased() == type.rawValue.lowercased()
      }
    }
    return animals.filter { $0.name.contains(text) }
  }
}
