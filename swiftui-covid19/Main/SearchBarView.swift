//
//  SearchBarView.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 02/05/22.
//

import SwiftUI

struct SearchBarView: View {

  @Binding var searchText: String

    var body: some View {
      HStack {
        TextField("Países...", text: $searchText)
          .foregroundColor(.white)
          .padding()
      }
      .frame(height: 50)
      .background(.regularMaterial)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
      SearchBarView(searchText: .constant(""))
    }
}
