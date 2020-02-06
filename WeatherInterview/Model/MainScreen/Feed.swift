//
//  Feed.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 07.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

class Feed {
    private let datastore: PersistenceProvider
    private let forecastProvider: ForecastProvider
    private var cache = [GPSLocation: Result<Forecast, BackendError>]()
    
    init(datastore: PersistenceProvider, forecastProvider: ForecastProvider) {
        self.datastore = datastore
        self.forecastProvider = forecastProvider
    }
}

extension Feed {
    func totalLocations() -> Int {
        return datastore.locationsCount()
    }
   
    @discardableResult
    func forecastForLocation(at index: Int, handler: @escaping ForecastHandler) -> Cancelable? {
        let location = datastore.location(at: index)
        
        guard let forecast = cache[location] else {
            return forecastProvider.forecast(at: location) { [unowned self] in
                handler($0)
                self.cache[location] = $0
            }
        }
        
        handler(forecast)
        return nil
    }
    
    func deleteLocation(at index: Int) {
        datastore.deleteLocation(at: index)
    }
    
    func invalidateCache() {
        cache.removeAll()
    }
}
