//
//  AnimalsRequestMock.swift
//  AdoptAPetTests
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import Foundation
@testable import AdoptAPet

enum AnimalsRequestMock: RequestProtocol {
  case getAnimals

  var requestType: RequestType {
    return .GET
  }

  var path: String {
    guard let path = Bundle.main.path(forResource: "AnimalsMock", ofType: "json") else { return "" }
    return path
  }
}
