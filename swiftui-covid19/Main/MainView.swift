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
            Text("Numero de casos")
              .font(.title2.bold())
              .foregroundColor(.white)
              .padding(10)

            TotalDataView(totalData: viewModel.totalData)

            viewModel.isSearchVisible ? SearchBarView(searchText: $viewModel.searchText) : nil

            Text("Todos os países")
              .font(.title2.bold())
              .foregroundColor(.white)
              .padding(10)

            List {
              Section {
                ForEach(viewModel.allCountries.filter {
                  viewModel.searchText.isEmpty ? true :
                  $0.name.lowercased().contains(viewModel.searchText.lowercased())
                }, id: \.iso) { country in
                  NavigationLink(destination: Text("Hello")){
                    Text(country.name)
                  }
                }
              }
            }

            .listStyle(.plain)
          }
        }
        .navigationTitle("Estatisticas Global")

        .toolbar {
          Button {
            viewModel.isSearchVisible.toggle()
            if !viewModel.isSearchVisible {
              viewModel.searchText = ""
            }
          } label: {
            Image(systemName: "magnifyingglass")
          }
          .tint(.white)
        }
        .accentColor(.white)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
