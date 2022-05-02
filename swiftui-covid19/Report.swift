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
}

struct RegionDetail: Codable {
  let name: String
  let province: String
}
