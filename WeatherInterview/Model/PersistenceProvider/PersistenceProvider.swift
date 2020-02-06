//
//  PersistenceProvider.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 07.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

protocol PersistenceProvider {
    func locationsCount() -> Int
    func location(at index: Int) -> GPSLocation
    func deleteLocation(at index: Int)
    func insert(location: GPSLocation)
}
