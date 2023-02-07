//
//  AnimalsFetcherMock.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import Foundation
import CoreLocation

struct AnimalsFetcherMock: AnimalsFetcher {
  func fetchAnimals(
    page: Int,
    latitude: Double?,
    longitude: Double?
  ) async -> [Animal] {
    return Animal.mock
  }
}
