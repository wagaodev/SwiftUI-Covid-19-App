//
//  AlertItem.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 03/05/22.
//

import SwiftUI

struct GenericError: Identifiable {
  let id = UUID()
  let title: Text
  let message: Text
  let dismissButton: Alert.Button
}

struct GenericContext {

  static let unableFetchTotalStats = GenericError(title: Text("Houve um problema!"),
                                               message: Text("O server não correspondeu como deveria. \n Por favor, tente novamente mais tarde."),
                                               dismissButton: .default(Text("Ok")))

}
