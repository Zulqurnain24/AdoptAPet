//
//  EmptyResultsView.swift
//  AdoptAPet
//
//  Created by Mohammad Zulqurnain on 07/02/2023.
//

import SwiftUI

struct EmptyResultsView: View {
  let query: String
  var body: some View {
    VStack {
      Image(systemName: "pawprint.circle.fill")
        .resizable()
        .frame(width: 64, height: 64)
        .padding()
        .foregroundColor(.yellow)
      Text("Sorry, we couldn't find animals for \"\(query)\"")
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
    }
  }
}

struct EmptyResultsView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyResultsView(query: "Kiki")
  }
}
