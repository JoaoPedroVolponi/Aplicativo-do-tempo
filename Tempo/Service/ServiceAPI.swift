//
//  ServiceAPI.swift
//  Tempo
//
//  Created by João Pedro Rosada Volponi on 02/12/23.
//

import Foundation

struct City {
    let lat: String
    let lon: String
    let name: String
}

class Service {
    
    private let baseURL: String = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "aff2288a0cf08358f4a4e56f014cbede"
    private let session = URLSession.shared
    
    
    func fetchData(city: City, _ completion: @escaping(String) -> Void) {
        let urlString: String = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            completion("Oi")
        }
        
        task.resume()
    }
}

// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    let current: Forecast
    let hourly: [Forecast]
    let daily: [DailyForecast]
    
    enum CodingKeys: String, CodingKey {
        case current, hourly, daily
    }
}

// MARK: - Alert
struct Alert: Codable {
    let senderName, event: String
    let start, end: Int
    let description: String
    let tags: [JSONAny]
    
    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event, start, end, description, tags
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - DailyForecast
struct DailyForecast: Codable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}
