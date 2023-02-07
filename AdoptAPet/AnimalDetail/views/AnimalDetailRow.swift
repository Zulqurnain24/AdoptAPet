//
//  AnimalDetailRow.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import SwiftUI

struct AnimalDetailRow: View {
  let animal: AnimalEntity

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        AnimalDetailCard(
          title: "Age",
          value: animal.age.rawValue,
          color: animal.age.color
        )

        AnimalDetailCard(
          title: "Gender",
          value: animal.gender.rawValue,
          color: .pink
        )

        AnimalDetailCard(
          title: "Size",
          value: animal.size.rawValue,
          color: .mint
        )

        if let coat = animal.coat {
          AnimalDetailCard(
            title: "Coat",
            value: coat.rawValue,
            color: Color(UIColor(named: "coat-background-color") ?? .systemBrown)
          )
        }
      }
      .padding(.horizontal)
    }
  }
}

struct AnimalDetailCards_Previews: PreviewProvider {
  static var previews: some View {
    if let animal = CoreDataHelper.getTestAnimalEntity() {
      AnimalDetailRow(animal: animal)
        .previewLayout(.sizeThatFits)
    }
  }
}
