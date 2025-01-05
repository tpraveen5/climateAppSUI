//
//  WeatherViewModel.swift
//  ClimateAppSwiftUI
//
//  Created by Talari Praveen kumar on 05/01/25.
//

//import Foundation
//
//
//class WeatherViewModel: ObservableObject {
//    @Published var cityName: String = ""
//    @Published var weatherData: WeatherResponse?
//    @Published var errorMessage: String?
//    
//    private let service = WeatherService()
//    
//    func fetchWeather() {
//        guard !cityName.isEmpty else {
//            errorMessage = "Please enter a city name."
//            return
//        }
//        
//        service.fetchWeather(for: cityName) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let weather):
//                    self?.weatherData = weather
//                    self?.errorMessage = nil
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
//}


import Foundation

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = ""
    @Published var weatherData: WeatherResponse?
    @Published var errorMessage: String?
    
    private let service = WeatherService()
    
    func fetchWeather() {
        guard !cityName.isEmpty else {
            errorMessage = "Please enter a city name."
            return
        }
        
        service.fetchWeather(for: cityName) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.weatherData = weather
                    self?.errorMessage = nil
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    // Computed property to filter out duplicates based on date
    var filteredWeather: [WeatherDetail] {
        guard let weatherData = weatherData else { return [] }
        
        var displayedDates = Set<String>()
        return weatherData.list.filter { detail in
            let formattedDate = formatDate(detail.dt)
            if displayedDates.contains(formattedDate) {
                return false
            } else {
                displayedDates.insert(formattedDate)
                return true
            }
        }
    }
    
    // Helper method to format the date for comparison
    private func formatDate(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}
