//
//  MainViewController.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import Foundation

final class MainViewModel: ObservableObject {
  @Published var totalData = TotalData.initialState
  @Published var allCountries: [Country] = []
  @Published var searchText = ""
  @Published var isSearchVisible = false

  init() {
    fetchTotalData()
    fetchAllCountries()
  }

  func fetchTotalData() {
    APIService.shared.fetchTotalData { result in

      DispatchQueue.main.async {
        switch result {
          case .success(let totalData):
            self.totalData = totalData
          case .failure(_):
            print("DEBUG: Error total data...")
            // TODO: Create an error
        }
      }

    }
  }

  func fetchAllCountries() {
    APIService.shared.fetchAllRegions { result in

      DispatchQueue.main.async {
        switch result {
          case .success(let allCountries):
            self.allCountries = allCountries.sorted(by: { $0.name < $1.name})
          case .failure(_):
            print("DEBUG: Error total data...")
            //TODO: Create an error
        }
      }

    }
  }
}
