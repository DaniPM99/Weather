//
//  ViewController.swift
//  Weather
//
//  Created by Daniel Parra Martin on 25/2/24.
//

import UIKit

class MainView: UIViewController {
    private let mainViewModel = MainViewModel(apiClient: APIClient())
    
     let ubication: UILabel = {
        let uilabel = UILabel()
         uilabel.text = "Mi ubicación"
         uilabel.translatesAutoresizingMaskIntoConstraints = false
        return uilabel
    }()
    
    private let city: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Barcelona"
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        return uilabel
    }()
    
    private let temperature: UILabel = {
        let uilabel = UILabel()
        uilabel.text = String(14)
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        return uilabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel.getWeather(withCountry: "Spain")

        [ubication,
         city,
         temperature]
            .forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            ubication.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ubication.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            ubication.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            ubication.bottomAnchor.constraint(equalTo: city.topAnchor, constant: -20),
            
            city.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            city.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            city.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            city.bottomAnchor.constraint(equalTo: temperature.topAnchor, constant: -20),
        
            temperature.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperature.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }


}

