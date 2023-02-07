//
//  AnimalSearcherService.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import Foundation

struct AnimalSearcherService {
  let requestManager: RequestManagerProtocol
}

// MARK: - AnimalSearcher
extension AnimalSearcherService: AnimalSearcher {
  func searchAnimal(
    by text: String,
    age: AnimalSearchAge,
    type: AnimalSearchType
  ) async -> [Animal] {
    let requestData = AnimalsRequest.getAnimalsBy(
      name: text,
      age: age != .none ? age.rawValue : nil,
      type: type != .none ? type.rawValue : nil
    )
    do {
      let animalsContainer: AnimalsContainer = try await requestManager
        .initRequest(
          with: requestData
        )
      return animalsContainer.animals
    } catch {
      print(error.localizedDescription)
      return []
    }
  }
}
