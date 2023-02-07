//
//  APIManagerMock.swift
//  AdoptAPetTests
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import XCTest
@testable import AdoptAPet

struct APIManagerMock: APIManagerProtocol {
  func initRequest(with data: RequestProtocol, authToken: String) async throws -> Data {
    return try Data(contentsOf: URL(fileURLWithPath: data.path), options: .mappedIfSafe)
  }
}
