//
//  Forecast.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 05.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

struct Forecast: Equatable {
    let name: String
    let latitude: Double
    let longitude: Double
    let summary: String
    let country: String
    let windSpeed: Double
    let humidity: Double
    let temperature: Double
}

extension Forecast {
    init(payload: ForecastPayload) {
        name = payload.name ?? ""
        latitude = payload.coord?.lat ?? 0.0
        longitude = payload.coord?.lon ?? 0.0
        summary = payload.weather?.first?.descriptionField?.capitalized ?? ""
        country = payload.sys?.country ?? ""
        windSpeed = payload.wind?.speed ?? 0.0
        humidity = Double(payload.main?.humidity ?? 0)
        temperature = payload.main?.temp ?? 0.0
    }
}
