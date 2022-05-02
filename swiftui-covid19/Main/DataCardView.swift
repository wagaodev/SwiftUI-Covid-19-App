//
//  DataCardView.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import SwiftUI

struct DataCardView: View {

  var number: String = "--"
  var name: String = "Error"
  var color: Color = .primary


  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 10){
        Text(self.number)
          .font(.title3)
          .foregroundColor(self.color)

        Text(self.name)
          .font(.title3)
          .foregroundColor(self.color)
      }
      .frame(width: geometry.size.width, height: 80, alignment: .center)
      .background(Color("cardBackground"))
      .cornerRadius(12.0)
    }
  }
}

struct DataCardView_Previews: PreviewProvider {
  static var previews: some View {
    DataCardView()
  }
}
