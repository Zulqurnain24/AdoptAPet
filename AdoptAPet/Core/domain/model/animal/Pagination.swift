//
//  Pagination.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

struct Pagination: Codable {
  let countPerPage: Int
  let totalCount: Int
  let currentPage: Int
  let totalPages: Int
}
