//
//  Forecast.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 05.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

struct Forecast: Equatable {
    let timezone: String
    let latitude: Double
    let longitude: Double
    let summary: String
    let forecast: String
    let windSpeed: Double
    let humidity: Double
    let temperature: Double
}

extension Forecast {
    init(payload: ForecastPayload) {
        timezone = payload.timezone
        latitude = payload.latitude
        longitude = payload.longitude
        summary = payload.currently.summary
        forecast = payload.hourly.summary
        windSpeed = payload.currently.windSpeed
        humidity = payload.currently.humidity
        temperature = payload.currently.temperature
    }
}
