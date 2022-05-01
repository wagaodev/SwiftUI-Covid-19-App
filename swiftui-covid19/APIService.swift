//
//  APIService.swift
//  swiftui-covid19
//
//  Created by WAGNER GOULART on 01/05/22.
//

import Foundation

final class APIService {
  static let shared = APIService()

  private init () { }

  private let headers = [
    "X-RapidAPI-Host": ProcessInfo.processInfo.environment["RAPID_API_HOST"]
    "X-RapidAPI-Key": ProcessInfo.processInfo.environment["RAPID_API_KEY"]
  ]

  private let baseURLString = "https://covid-19-statistics.p.rapidapi.com"

  func fetchTotalData(completion: @escaping (Result<TotalData, Error>) -> Void){

      let totalURLString = baseURLString + "/reports/total"
      let url = URL(string: totalURLString)
      guard let url = url else { return }

      let request = NSMutableURLRequest(url: NSURL(string: totalURLString)! as URL,
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

