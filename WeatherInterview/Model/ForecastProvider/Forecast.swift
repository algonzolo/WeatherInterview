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
        timezone = String("\(payload.timezone)")
        latitude = payload.coord?.lat ?? 0.0
        longitude = payload.coord?.lon ?? 0.0
        summary = payload.weather?.first?.descriptionField?.capitalized ?? ""
        forecast = payload.sys?.country ?? ""
        windSpeed = payload.wind?.speed ?? 0.0
        humidity = Double(payload.main?.humidity ?? 0)
        temperature = payload.main?.temp ?? 0.0
    }
}
