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
    "X-RapidAPI-Host": "covid-19-statistics.p.rapidapi.com",
    "X-RapidAPI-Key": ProcessInfo.processInfo.environment["RAPID_API_KEY"]!
  ]

  private let baseURLString = "https://covid-19-statistics.p.rapidapi.com"

  func fetchTotalData(completion: @escaping (Result<TotalData, Error>) -> Void){

      let totalURLString = baseURLString + "/reports/total"
      let url = URL(string: totalURLString)
      guard let url = url else {
        completion(.failure(CovidError.incorrectURL))
        return

      }

    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

      request.httpMethod = "GET"
      request.allHTTPHeaderFields = headers

      let session = URLSession.shared

      let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
        if error != nil {
          completion(.failure(CovidError.noDataReceived))
        } else {
//          if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//            print("DEBUG: Data response \(json)")
          let decoder = JSONDecoder()

          do {
            let totalDataObject = try decoder.decode(TotalDataObject.self, from: data!)
            completion(.success(totalDataObject.data))
          }catch let error{
            completion(.failure(error))
          }
        }
      })

      dataTask.resume()
  }

  func fetchAllRegions(completion: @escaping (Result<[Country], Error>) -> Void){

      let countriesURLString = baseURLString + "/regions"
      let url = URL(string: countriesURLString)
      guard let url = url else {
        completion(.failure(CovidError.incorrectURL))
        return

      }

    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

      request.httpMethod = "GET"
      request.allHTTPHeaderFields = headers

      let session = URLSession.shared

      let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
        if error != nil {
          completion(.failure(CovidError.noDataReceived))
        } else {
          let decoder = JSONDecoder()

          do {
            let allCountries = try decoder.decode(AllRegions.self, from: data!)
            completion(.success(allCountries.data))
          }catch let error{
            completion(.failure(error))
          }
        }
      })

      dataTask.resume()
  }

//  func fetchAllRegions(completion: @escaping (Result<[Country], Error>) -> Void){
//
//      let countriesURLString = baseURLString + "/regions"
//      let url = URL(string: countriesURLString)
//      guard let url = url else {
//        completion(.failure(CovidError.incorrectURL))
//        return
//
//      }
//
//    var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
//
//      request.httpMethod = "GET"
//      request.allHTTPHeaderFields = headers
//
//      let session = URLSession.shared
//
//      let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
//        if error != nil {
//          completion(.failure(CovidError.noDataReceived))
//        } else {
//          let decoder = JSONDecoder()
//
//          do {
//            let allCountries = try decoder.decode(AllRegions.self, from: data!)
//            completion(.success(allCountries.data))
//          }catch let error{
//            completion(.failure(error))
//          }
//        }
//      })
//
//      dataTask.resume()
//  }
}
