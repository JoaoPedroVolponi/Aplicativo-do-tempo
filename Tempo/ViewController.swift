//
//  ViewController.swift
//  Tempo
//
//  Created by João Pedro Rosada Volponi on 28/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Image Background
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // HeaderView
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "whiteColor")
        view.layer.cornerRadius = 20
        return view
    }()
    
    // City Label
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "São Paulo"
        label.textAlignment = .center
        label.textColor = UIColor(named: "primaryColor")
        return label
    }()
    
    // Temperature Label
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        label.text = "25°C"
        label.textAlignment = .left
        label.textColor = UIColor(named: "bluePrimary")
        return label
    }()
    
    // Weather Icon
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "daylight")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Humidity StackView
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    // Humidity Label
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Umidade"
        label.font =  UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "whiteColor")
        return label
    }()
    
    // Humidity Value Label
    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100mm"
        label.font =  UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "whiteColor")
        return label
    }()
    
    // Wind StackView
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    // Wind Label
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vento"
        label.font =  UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "whiteColor")
        return label
    }()
    
    // Wind Value Label
    private lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10km/h"
        label.font =  UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "whiteColor")
        return label
    }()
    
    // Stats StackView
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "blueSecundary")
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        return stackView
    }()
    
    // hourlyForecast label
    private lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "whiteColor")
        label.text = "Previsão por Hora"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setContraints()
        
    }
    
    private func setHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(headerView)
        view.addSubview(statsStackView)
        view.addSubview(hourlyForecastLabel)
        
        // HeaderView
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
        
    }
    
    private func setContraints() {
        
        // Image Background
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // HeaderView
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169),
        ])
        
        // CityLabel
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // TemperatureLabel
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 26),
            temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26)
        ])
        
        // WeatherIcon
        NSLayoutConstraint.activate([
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 15),
        ])
        
        // StatsStackView
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // hourlyForecastLabel
        NSLayoutConstraint.activate([
            hourlyForecastLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 29),
            hourlyForecastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            hourlyForecastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
        ])
        
    }
    
}

