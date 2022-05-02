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
            Color(red: 0.125, green: 0.35, blue: 0.25),
            Color(red: 0.40, green: 0.44, blue: 0.99)
          ], startPoint: .topLeading, endPoint: .bottomTrailing)
          .ignoresSafeArea()

          VStack(alignment: .leading){
            Text("World Total")
              .font(.title2.bold())
              .foregroundColor(.white)
              .padding(10)
          }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
