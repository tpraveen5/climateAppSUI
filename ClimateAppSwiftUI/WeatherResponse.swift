//
//  WeatherResponse.swift
//  ClimateAppSwiftUI
//
//  Created by Talari Praveen kumar on 05/01/25.
//

import Foundation


public struct WeatherResponse: Codable {
    var city: City
    var list: [WeatherDetail]
}

struct City: Codable {
    let name: String
}

struct WeatherDetail: Codable {
    let dt: Int
    let main: MainWeather
    let weather: [Weather]
}

struct MainWeather: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let icon: String
}
