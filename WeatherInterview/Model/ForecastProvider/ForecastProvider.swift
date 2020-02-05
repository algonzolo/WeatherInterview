//
//  ForecastProvider.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 05.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

typealias ForecastHandler = (Result<Forecast, BackendError>) -> Void

protocol ForecastProvider {
    func forecast(at location: GPSLocation, handler: @escaping ForecastHandler) -> Cancelable
}
