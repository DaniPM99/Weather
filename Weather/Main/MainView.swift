//
//  ViewController.swift
//  Weather
//
//  Created by Daniel Parra Martin on 25/2/24.
//

import UIKit

class MainView: UIViewController {
    private let mainViewModel = MainViewModel(apiClient: APIClient())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel.getWeather(withCountry: "Spain")
        view.backgroundColor = UIColor.gray
        setupScrollView()
    }
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subView1: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()
    private let subView2: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        view.backgroundColor = UIColor.cyan
        view.layer.cornerRadius = 10
        return view
    }()
    private let subView3: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        view.backgroundColor = UIColor.blue
        view.layer.cornerRadius = 10
        return view
    }()
    
    let ubication: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Mi ubicación"
        uilabel.font = UIFont.systemFont(ofSize: 25)
        uilabel.textAlignment = NSTextAlignment.center
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        return uilabel
    }()
    
    private let city: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Barcelona"
        uilabel.font = UIFont.systemFont(ofSize: 25)
        uilabel.textAlignment = NSTextAlignment.center
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        return uilabel
    }()
    
    private let temperature: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "14º"
        uilabel.font = UIFont.systemFont(ofSize: 75)
        uilabel.textAlignment = NSTextAlignment.center
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        return uilabel
    }()
    
    private let state: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Lluvia"
        uilabel.font = UIFont.systemFont(ofSize: 15)
        uilabel.textAlignment = NSTextAlignment.center
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        return uilabel
    }()
    
    private let text: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "Se prevé que esté despejado esta noche y hasta mañana por la mañana. Rachas de viento de hasta 7 km/h."
        uilabel.font = UIFont.systemFont(ofSize: 15)
        uilabel.textAlignment = NSTextAlignment.center
        uilabel.translatesAutoresizingMaskIntoConstraints = false
        uilabel.numberOfLines = 0
        return uilabel
    }()
    
    private func setupScrollView() {
        let margins = view.layoutMarginsGuide
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        setupSubView1()
        setupSubView2()
        setupSubView3()
        configureContainerView()
    }
    
    private func setupSubView1() {
        subView1.addSubview(ubication)
        subView1.addSubview(city)
        subView1.addSubview(temperature)
        subView1.addSubview(state)
        
        ubication.centerXAnchor.constraint(equalTo: subView1.centerXAnchor).isActive = true
        ubication.leadingAnchor.constraint(equalTo: subView1.leadingAnchor, constant: 32).isActive = true
        ubication.trailingAnchor.constraint(equalTo: subView1.trailingAnchor, constant: -32).isActive = true
        ubication.bottomAnchor.constraint(equalTo: city.topAnchor).isActive = true
        ubication.topAnchor.constraint(equalTo: subView1.topAnchor, constant: 10).isActive = true

        city.centerXAnchor.constraint(equalTo: subView1.centerXAnchor).isActive = true
        city.leadingAnchor.constraint(equalTo: subView1.leadingAnchor, constant: 32).isActive = true
        city.trailingAnchor.constraint(equalTo: subView1.trailingAnchor, constant: -32).isActive = true
        city.bottomAnchor.constraint(equalTo: temperature.topAnchor).isActive = true

        temperature.centerXAnchor.constraint(equalTo: subView1.centerXAnchor).isActive = true
        temperature.centerYAnchor.constraint(equalTo: subView1.centerYAnchor).isActive = true
        temperature.widthAnchor.constraint(equalToConstant: 140).isActive = true
        temperature.heightAnchor.constraint(equalToConstant: 85).isActive = true

        state.centerXAnchor.constraint(equalTo: subView1.centerXAnchor).isActive = true
        state.leadingAnchor.constraint(equalTo: subView1.leadingAnchor, constant: 32).isActive = true
        state.trailingAnchor.constraint(equalTo: subView1.trailingAnchor, constant: -32).isActive = true
        state.topAnchor.constraint(equalTo: temperature.bottomAnchor).isActive = true
    }
    
    private func setupSubView2() {
        subView2.addSubview(text)
        
        text.centerXAnchor.constraint(equalTo: subView2.centerXAnchor).isActive = true
        text.leadingAnchor.constraint(equalTo: subView2.leadingAnchor, constant: 32).isActive = true
        text.trailingAnchor.constraint(equalTo: subView2.trailingAnchor, constant: -32).isActive = true
        text.topAnchor.constraint(equalTo: subView2.topAnchor, constant: 10).isActive = true
    }
    
    private func setupSubView3() {
        
    }
    
    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(subView1)
        scrollStackViewContainer.addArrangedSubview(subView2)
        scrollStackViewContainer.addArrangedSubview(subView3)
    }
    
    
}

