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
            Text("Contagem Global")
              .font(.title2.bold())
              .foregroundColor(.white)
              .padding(10)

            TotalDataView(totalData: viewModel.totalData)

            Text("Todos os países")
              .font(.title2.bold())
              .foregroundColor(.white)
              .padding(10)

            List {
              Section {
                ForEach(viewModel.allCountries, id: \.iso) { country in
                  Text(country.name)
                }
              }
            }
          }
        }
        .navigationTitle("Estatisticas")

        .toolbar {
          Button {
            print("DEBUG: Show Search...")
          } label: {
            Image(systemName: "magnifyingglass")
          }
          .tint(.white)
        }
        


      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
