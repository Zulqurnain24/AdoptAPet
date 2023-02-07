//
//  AnimalLocationView.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import SwiftUI
import MapKit

struct AnimalLocationView: View {
  let animal: AnimalEntity

  @StateObject var addressFetcher = AddressFetcher()

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text("Location")
        .font(.headline)
        .accessibility(label: Text("Location Header"))
      Text(animal.address)
        .font(.subheadline)
        .textSelection(.enabled)
        .accessibility(label: Text("The pet's address: " + animal.address))

      Button(action: openAddressInMaps) {
        Map(coordinateRegion: $addressFetcher.coordinates, interactionModes: [])
      }
      .buttonStyle(.plain)
      .frame(height: 200)
      .cornerRadius(16)
      .task {
        await addressFetcher.search(by: animal.address)
      }
    }
  }

  func openAddressInMaps() {
    let placemark = MKPlacemark(coordinate: addressFetcher.coordinates.center)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.openInMaps(launchOptions: nil)
  }
}

struct AnimalLocationView_Previews: PreviewProvider {
  static var previews: some View {
    if let animal = CoreDataHelper.getTestAnimalEntity() {
      AnimalLocationView(animal: animal)
        .padding()
        .previewLayout(.sizeThatFits)
    }
  }
}
