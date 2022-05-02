//
//  TotalDataView.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import SwiftUI

struct TotalDataView: View {

  var totalData: TotalData

  var body: some View {
    VStack {
      HStack {
        DataCardView(number: totalData.confirmed.formatNumber, name: "Confirmados")
        DataCardView(number: totalData.active.formatNumber, name: "Ativos", color: .blue)
      }
      HStack {
        DataCardView(number: totalData.deaths.formatNumber, name: "Mortes", color: .red)
        DataCardView(number: String(format: "%.2f", totalData.fatality_rate), name: "% de mortes", color: .red)
      }
    }
    .frame(height: 170)
    .padding(10)
  }
}

struct TotalDataView_Previews: PreviewProvider {
  static var previews: some View {
    TotalDataView(totalData: TotalData.initialState)
  }
}
