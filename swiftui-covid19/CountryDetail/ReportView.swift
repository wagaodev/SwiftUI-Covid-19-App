//
//  ReportView.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 02/05/22.
//

import SwiftUI

struct ReportView: View {

  var report: RegionReport

    var body: some View {
      ZStack(alignment: .top) {

        LinearGradient(colors: [
          Color(red: 0.125, green: 0.35, blue: 0.25),
          Color(red: 0.40, green: 0.44, blue: 0.99)
        ], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()



        VStack {
          Spacer()
          Text(report.region.name)
            .foregroundColor(.white)
            .font(.largeTitle)
          Text(report.region.province)
            .foregroundColor(.white)
            .font(.title)

          Spacer()

          VStack(alignment: .leading, spacing: 15){
            Text("Date: \(report.formattedDate)")
            Text("Casos Confirmados: \(report.confirmed.roudedWithAbrreviations)")
            Text("Casos Ativos: \(report.confirmed.roudedWithAbrreviations)")
            Text("Mortes: \(report.deaths.roudedWithAbrreviations)")
            Text("Índice de Fatalidade: \(report.fatality_rate.formatted())%")
          }
          .font(.title2)
          .frame(maxWidth: .infinity)
          .padding(50)
          .background(.ultraThinMaterial)
          .clipShape(RoundedRectangle(cornerRadius: 32))
          .padding()

          Spacer()
          Spacer()
        }

      }

    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
      ReportView(report: RegionReport.initialState)
    }
}
