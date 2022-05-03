//
//  Report.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import Foundation

struct AllReports: Codable {
  let data: [RegionReport]
}

struct RegionReport: Codable, Identifiable {
  let id = UUID()
  let date: Date
  let confirmed: Int
  let deaths: Int
  let active: Int
  let fatality_rate: Double
  let region: RegionDetail

  var formattedDate: String {
    date.formatted(date: .abbreviated, time: .omitted)
  }

  static let initialState = RegionReport(date: Date.now, confirmed: 0, deaths: 0, active: 0, fatality_rate: 0.0, region: RegionDetail(name: "N/A", province: "Province"))
}

struct RegionDetail: Codable {
  let name: String
  let province: String
}
