//
//  APIService.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import Foundation

final class APIService {
  static let shared = APIService()

  private init () {

    private let headers = [
      "X-RapidAPI-Host": "covid-19-statistics.p.rapidapi.com",
      "X-RapidAPI-Key": "dca3493c88msh23d808d6828b0d4p1382bcjsn6694cbbd71a7"
    ]

    func fetchTotalData(){


      let request = NSMutableURLRequest(url: NSURL(string: "https://covid-19-statistics.p.rapidapi.com/regions")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
      request.httpMethod = "GET"
      request.allHTTPHeaderFields = headers

      let session = URLSession.shared
      let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
          print(error)
        } else {
          let httpResponse = response as? HTTPURLResponse
          print(httpResponse)
        }
      })

      dataTask.resume()
    }
  }
}
