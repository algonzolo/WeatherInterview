//
//  ForecastPayload.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 05.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

struct ForecastPayload: Decodable {
    var timezone: String
    var latitude: Double
    var longitude: Double
    var currently: CurrentWeather
    var hourly: HourlyWeather
    
    struct CurrentWeather: Decodable {
        var summary: String
        var windSpeed: Double
        var humidity: Double
        var temperature: Double
    }
    
    struct HourlyWeather: Decodable {
        var summary: String
    }
}
