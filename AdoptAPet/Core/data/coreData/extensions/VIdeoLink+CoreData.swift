//
//  VIdeoLink+CoreData.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import CoreData

extension VideoLink: CoreDataPersistable {
  var keyMap: [PartialKeyPath<VideoLink>: String] {
    [
      \.embedded: "embedded",
      \.id: "id"
    ]
  }

  typealias ManagedType = VideoLinkEntity
}
