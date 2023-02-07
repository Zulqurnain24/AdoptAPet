//
//  AnimalAttributes.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

struct AnimalAttributes: Codable {
  var id: Int?
  var spayedNeutered: Bool? = false
  var houseTrained: Bool? = false
  var declawed: Bool? = false
  var specialNeeds: Bool? = false
  var shotsCurrent: Bool? = false
}
