//
//  Region.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import Foundation

struct AllRegions: Codable {
  let data: [Country]
}

struct Country: Codable {
  let iso: String
  let name: String
}
