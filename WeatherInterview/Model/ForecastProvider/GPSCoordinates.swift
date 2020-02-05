//
//  GPSCoordinates.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 05.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

struct GPSLocation: Hashable {
    let latitude: Double
    let longitude: Double
}

extension GPSLocation {
    init(managedObject: Location) {
        latitude = managedObject.latitude
        longitude = managedObject.longitude
    }
}
