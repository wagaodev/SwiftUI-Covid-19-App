//
//  TotalData.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import Foundation

struct TotalDataObject: Codable {
  let data: TotalData
}

struct TotalData: Codable {
  let confirmed: Int
  let deaths: Int
  let active: Int
  let fatality_rate: Double

  static let initialState = TotalData(confirmed: 0, deaths: 0, active: 0, fatality_rate: 0.0)
}
