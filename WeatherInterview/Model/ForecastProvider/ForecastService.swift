//
//  ForecastService.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 05.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Alamofire

class ForecastService {
    private var endpoint: String
    
    private enum Constants {
        static let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
        static let appID = "appid=d0b770e75a9ac5ae168cf27bf94bbf86"
        static let units = "&units=metric"
        
    }
    
    init() {
        self.endpoint = "\(Constants.baseURL)\(Constants.appID)\(Constants.units)"
    }
}

// MARK: - ForecastProviding
extension ForecastService: ForecastProvider {
    func forecast(at location: GPSLocation, handler: @escaping ForecastHandler) -> Cancelable {
        guard let url = URL(string: endpoint + "&lat=\(location.latitude)&lon=\(location.longitude)") else {
            fatalError("Internal inconsistency")
        }
        return Alamofire.request(url)
            .responseData { response in
                let decoder = JSONDecoder()
                let result: Result<ForecastPayload> = decoder.decodeResponse(from: response)
                
                switch result {
                case .success(let payload):
                    handler(.success(Forecast(payload: payload)))
                case .failure(let error):
                    handler(.failure(.network(error: error)))
                }
        }
    }
}

