//
//  ContentView.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
              APIService.shared.fetchReport(for: "BGR"){ result in
                switch result {
                  case .success(let region):
                    print(region.count)
                    print(region.first!.formattedDate)
                  case .failure(let error):
                    print(error.localizedDescription)
                }
              }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
