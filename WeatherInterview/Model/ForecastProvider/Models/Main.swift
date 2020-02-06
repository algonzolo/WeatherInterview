//
//	Main.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 06.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

struct Main : Codable {

	let feelsLike : Double?
	let humidity : Int?
	let pressure : Int?
	let temp : Double?
	let tempMax : Double?
	let tempMin : Double?


	enum CodingKeys: String, CodingKey {
		case feelsLike = "feels_like"
		case humidity = "humidity"
		case pressure = "pressure"
		case temp = "temp"
		case tempMax = "temp_max"
		case tempMin = "temp_min"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		feelsLike = try values.decodeIfPresent(Double.self, forKey: .feelsLike)
		humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
		pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
		temp = try values.decodeIfPresent(Double.self, forKey: .temp)
		tempMax = try values.decodeIfPresent(Double.self, forKey: .tempMax)
		tempMin = try values.decodeIfPresent(Double.self, forKey: .tempMin)
	}


}
