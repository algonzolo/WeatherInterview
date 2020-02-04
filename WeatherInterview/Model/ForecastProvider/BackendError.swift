//
//  BackendError.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 04.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

enum BackendError: Error {
    case network(error: Error) // Capture any underlying Error from the Alamofire API
    case parsing(reason: String)
}
