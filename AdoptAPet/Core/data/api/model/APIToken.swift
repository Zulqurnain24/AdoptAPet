//
//  APIToken.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import Foundation

struct APIToken {
  let tokenType: String
  let expiresIn: Int
  let accessToken: String
  private let requestedAt = Date()
}

// MARK: - Codable
extension APIToken: Codable {
  enum CodingKeys: String, CodingKey {
    case tokenType
    case expiresIn
    case accessToken
  }
}

// MARK: - Helper properties
extension APIToken {
  var expiresAt: Date {
    Calendar.current.date(byAdding: .second, value: expiresIn, to: requestedAt) ?? Date()
  }

  var bearerAccessToken: String {
    "\(tokenType) \(accessToken)"
  }
}
