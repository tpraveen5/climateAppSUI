//
//  ContentView.swift
//  ClimateAppSwiftUI
//
//  Created by Talari Praveen kumar on 05/01/25.
//

import SwiftUI

//struct ContentView: View {
//    @StateObject private var viewModel = WeatherViewModel()
//    var body: some View {
//        //        NavigationView {
//        //             VStack {
//        //                 TextField("Enter city name", text: $viewModel.cityName)
//        //                     .textFieldStyle(RoundedBorderTextFieldStyle())
//        //                     .padding()
//        //
//        //                 Button(action: {
//        //                     viewModel.fetchWeather()
//        //                 }) {
//        //                     Text("Get Weather")
//        //                         .padding()
//        //                         .background(Color.blue)
//        //                         .foregroundColor(.white)
//        //                         .cornerRadius(8)
//        //                 }
//        //
//        //                 if let weatherData = viewModel.weatherData {
//        //                     Text("Weather in \(weatherData.city.name)")
//        //                         .font(.headline)
//        //                         .padding(.top)
//        //
//        //                     List(weatherData.list, id: \.dt) { detail in
//        //                         VStack(alignment: .leading) {
//        //                             Text("\(Date(timeIntervalSince1970: TimeInterval(detail.dt)), formatter: dateFormatter)")
//        //                                 .font(.subheadline)
//        //                             Text("Temp: \(detail.main.temp, specifier: "%.1f")°C")
//        //                             Text("Description: \(detail.weather.first?.description.capitalized ?? "-")")
//        //                         }
//        //                         .padding(.vertical, 4)
//        //                     }
//        ////                     List(viewModel.filteredWeather, id: \.dt) { detail in
//        ////                         VStack(alignment: .leading) {
//        ////                             Text("\(Date(timeIntervalSince1970: TimeInterval(detail.dt)), formatter: dateFormatter)")
//        ////                                 .font(.subheadline)
//        ////                             Text("Temp: \(detail.main.temp, specifier: "%.1f")°C")
//        ////                             Text("Description: \(detail.weather.first?.description.capitalized ?? "-")")
//        ////                         }
//        ////                         .padding(.vertical, 4)
//        ////                     }
//        //                 }
//        //
//        //                 if let errorMessage = viewModel.errorMessage {
//        //                     Text("Error: \(errorMessage)")
//        //                         .foregroundColor(.red)
//        //                         .padding(.top)
//        //                 }
//        //             }
//        //             .navigationTitle("Weather App")
//        //         }
//        NavigationView {
//            VStack {
//                TextField("Enter city name", text: $viewModel.cityName)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                
//                Button(action: {
//                    viewModel.fetchWeather()
//                }) {
//                    Text("Get Weather")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
//                
//                if let weatherData = viewModel.weatherData {
//                    Text("Weather in \(weatherData.city.name)")
//                        .font(.headline)
//                        .padding(.top)
//                    
//                    List($viewModel.filteredWeather, id: \.dt) { detail in
//                        VStack(alignment: .leading) {
//                            Text("\(Date(timeIntervalSince1970: TimeInterval(detail.dt)), formatter: dateFormatter)")
//                                .font(.subheadline)
//                            Text("Temp: \(detail.main.temp, specifier: "%.1f")°C")
//                            Text("Description: \(detail.weather.first?.description.capitalized ?? "-")")
//                        }
//                        .padding(.vertical, 4)
//                    }
//                }
//                
//                if let errorMessage = viewModel.errorMessage {
//                    Text("Error: \(errorMessage)")
//                        .foregroundColor(.red)
//                        .padding(.top)
//                }
//            }
//            .navigationTitle("Weather App")
//        }
//        
//        private let dateFormatter: DateFormatter = {
//            let formatter = DateFormatter()
//            formatter.dateStyle = .medium
//            return formatter
//        }()
//        
//    }
//}
//
//#Preview {
//    ContentView()
//}

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter city name", text: $viewModel.cityName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    viewModel.fetchWeather()
                }) {
                    Text("Get Weather")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if let weatherData = viewModel.weatherData {
                    Text("Weather in \(weatherData.city.name)")
                        .font(.headline)
                        .padding(.top)
                    
                    List(viewModel.filteredWeather.prefix(3), id: \.dt) { detail in
                        VStack(alignment: .leading) {
                            Text("\(Date(timeIntervalSince1970: TimeInterval(detail.dt)), formatter: dateFormatter)")
                                .font(.subheadline)
                            Text("Temp: \(detail.main.temp, specifier: "%.1f")°C")
                            Text("Description: \(detail.weather.first?.description.capitalized ?? "-")")
                        }
                        .padding(.vertical, 4)
                    }
                }
                
                if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding(.top)
                }
            }
            .navigationTitle("Weather App")
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

#Preview {
    ContentView()
}


