//
//  CountryDetailViewModel.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 02/05/22.
//

import Foundation


final class CountryDetailViewModel: ObservableObject {

  @Published var reports: [RegionReport] = []


  private var iso: String

  init(country: Country){
    iso = country.iso
  }

  func fetchReport(){
    APIService.shared.fetchReport(for: iso) { result in
      DispatchQueue.main.async {
        switch result {
          case .success(let reports):
            self.reports = reports
          case .failure(_):
            print("DEBUG: Error getting country report")
//            TODO: I need create an alert to that.
        }
      }
    }
  }
}
