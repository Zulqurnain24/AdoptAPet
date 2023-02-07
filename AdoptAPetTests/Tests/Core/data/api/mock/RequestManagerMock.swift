//
//  RequestManagerMock.swift
//  AdoptAPetTests
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import XCTest
@testable import AdoptAPet

class RequestManagerMock: RequestManagerProtocol {
  let apiManager: APIManagerProtocol
  let accessTokenManager: AccessTokenManagerProtocol

  init(apiManager: APIManagerProtocol, accessTokenManager: AccessTokenManagerProtocol) {
    self.apiManager = apiManager
    self.accessTokenManager = accessTokenManager
  }

  func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T {
    let authToken = try await requestAccessToken()
    let data = try await apiManager.initRequest(with: data, authToken: authToken)
    let decoded: T = try parser.parse(data: data)
    return decoded
  }

  func requestAccessToken() async throws -> String {
    if accessTokenManager.isTokenValid() {
      return accessTokenManager.fetchToken()
    }
    // swiftlint:disable:next force_unwrapping
    let data = AccessTokenTestHelper.generateValidToken().data(using: .utf8)!
    let token: APIToken = try parser.parse(data: data)
    try accessTokenManager.refreshWith(apiToken: token)
    return token.bearerAccessToken
  }
}
