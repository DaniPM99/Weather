//
//  MainViewModel.swift
//  Weather
//
//  Created by Daniel Parra Martin on 25/2/24.
//

import Foundation

class MainViewModel {
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    @MainActor
    func getWeather(withCountry country: String) {
        Task {
            do {
                let countryModel = try await apiClient.getWeather(withCountry: country)
                print(countryModel)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
