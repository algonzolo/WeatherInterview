//
//  Alamofire.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 04.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Alamofire

extension Request: Cancelable { }

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        guard response.error == nil else {
            debugPrint(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            debugPrint("didn't get any data from API")
            return .failure(BackendError.parsing(reason: "Did not get data in response"))
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            debugPrint("error trying to decode response")
            debugPrint(error)
            return .failure(error)
        }
    }
}
