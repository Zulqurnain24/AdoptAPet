//
//  RequestManager.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

protocol RequestManagerProtocol {
  var apiManager: APIManagerProtocol { get }
  var parser: DataParserProtocol { get }
  func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T
}


class RequestManager: RequestManagerProtocol {
  let apiManager: APIManagerProtocol
  let accessTokenManager: AccessTokenManagerProtocol

  init(
    apiManager: APIManagerProtocol = APIManager(),
    accessToken: AccessTokenManagerProtocol = AccessTokenManager()
  ) {
    self.apiManager = apiManager
    self.accessTokenManager = accessToken
  }

  func requestAccessToken() async throws -> String {
    if accessTokenManager.isTokenValid() {
      return accessTokenManager.fetchToken()
    }

    let data = try await apiManager.initRequest(with: AuthTokenRequest.auth, authToken: "")
    let token: APIToken = try parser.parse(data: data)
    try accessTokenManager.refreshWith(apiToken: token)
    return token.bearerAccessToken
  }

  func initRequest<T: Decodable>(with data: RequestProtocol) async throws -> T {
    let authToken = try await requestAccessToken()
    let data = try await apiManager.initRequest(with: data, authToken: authToken)
    let decoded: T = try parser.parse(data: data)
    return decoded
  }
}

// MARK: - Returns Data Parser
extension RequestManagerProtocol {
  var parser: DataParserProtocol {
    return DataParser()
  }
}
