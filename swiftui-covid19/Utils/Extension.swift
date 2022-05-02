//
//  Extension.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 02/05/22.
//

import Foundation

extension Int {
  func formatNumber() -> String {
    let formatter = NumberFormatter()
    formatter.groupingSeparator = ","
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value: self))!
  }

  var roudedWithAbrreviations: String {
    let number = Double(self)
    let million = number / 1_000_000

    if million >= 1.0 {
      return "\(round(million*10)/10)M"
    }else {
      return "\(self.formatNumber())"
    }
  }
}
