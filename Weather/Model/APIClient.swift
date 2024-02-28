//
//  APIClient.swift
//  Weather
//
//  Created by Daniel Parra Martin on 25/2/24.
//

import Foundation

let headers = [
    "X-RapidAPI-Key": Constants.API_KEY,
    "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com"
]

final class APIClient {
    func getWeather(withCountry country: String) async throws -> CountryWeather {
        let request = NSMutableURLRequest(url: NSURL(string: "https://weatherapi-com.p.rapidapi.com/current.json?q=\(country)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
        return try! JSONDecoder().decode(CountryWeather.self, from: data)
        /*let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                let decodedData = try! JSONDecoder().decode(CountryWeather.self, from: data!)
            }
        })
        dataTask.resume()
        return decodedData*/
    }
    
}
