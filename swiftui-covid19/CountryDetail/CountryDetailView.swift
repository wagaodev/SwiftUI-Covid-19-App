//
//  CountryDetailView.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 02/05/22.
//

import SwiftUI

struct CountryDetailView: View {


  @ObservedObject var viewModel: CountryDetailViewModel

  var body: some View {

    VStack {
      if viewModel.reports.count > 1 {
        List {
          ForEach(viewModel.reports) { report in
            NavigationLink(destination: ReportView(report: report)) {
              Text(report.region.province)
            }
          }
        }
        .listStyle(.plain)
        .navigationTitle(viewModel.reports.first?.region.name ??
        "País desconhecido")
      }else {
        ReportView(report: viewModel.reports.first ??
                   RegionReport.initialState)

      }
    }
    .onAppear {
      if viewModel.reports.count == 0 {
        viewModel.fetchReport()
      }
    }
  }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
      CountryDetailView(viewModel: CountryDetailViewModel(country: Country.initialState))
    }
}
