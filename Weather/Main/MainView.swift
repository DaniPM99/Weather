//
//  ViewController.swift
//  Weather
//
//  Created by Daniel Parra Martin on 25/2/24.
//

import UIKit

class MainView: UIViewController {
    private let mainViewModel = MainViewModel(apiClient: APIClient())
    
    /* let ubication: UITextView = {
        let textView = UITextView()
        textView.text = "Mi ubicación"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let city: UITextView = {
        let textView = UITextView()
        textView.text = "Barcelona"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let temperature: UITextView = {
        let textView = UITextView()
        textView.text = String(14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()*/
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel.getWeather(withCountry: "Spain")
        [emailTextField].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        /*[ubication,
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
        ])*/
    }


}

