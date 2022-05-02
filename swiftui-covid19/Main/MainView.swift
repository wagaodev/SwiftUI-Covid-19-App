//
//  ContentView.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import SwiftUI

struct MainView: View {

  @ObservedObject private var viewModel = MainViewModel()


    var body: some View {
      NavigationView {
        ZStack(alignment: .top) {

          LinearGradient(colors: [
            Color(red: 0.212, green: 249, blue: 255),
            Color(red: 0.88, green: 0, blue: 130)
          ], startPoint: .bottomTrailing, endPoint: .topLeading)
          .ignoresSafeArea()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
