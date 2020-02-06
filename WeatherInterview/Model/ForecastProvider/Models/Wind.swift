//
//	Wind.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 06.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//


import Foundation

struct Wind : Codable {

	let deg : Int?
	let speed : Double?


	enum CodingKeys: String, CodingKey {
		case deg = "deg"
		case speed = "speed"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		deg = try values.decodeIfPresent(Int.self, forKey: .deg)
		speed = try values.decodeIfPresent(Double.self, forKey: .speed)
	}


}
