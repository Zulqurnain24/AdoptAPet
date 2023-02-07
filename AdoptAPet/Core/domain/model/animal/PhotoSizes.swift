//
//  PhotoSizes.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import Foundation

struct PhotoSizes: Codable {
  var id: Int?
  var small: URL?
  var medium: URL?
  var large: URL?
  var full: URL?
}
