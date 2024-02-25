//
//  CountryWeather.swift
//  Weather
//
//  Created by Daniel Parra Martin on 25/2/24.
//

import Foundation

struct CountryWeather: Decodable {
    let location: Location
    let current: CurrentWeather
}

struct Location: Decodable {
    let name: String
    let region: String
    let country: String
}

struct CurrentWeather: Decodable {
    let temp_c: Int
    let condition: Condition
    
    struct Condition: Decodable {
        let text: String
        let icon: String
    }
}
