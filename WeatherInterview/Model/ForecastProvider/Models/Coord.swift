//
//	Coord.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 06.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

struct Coord : Codable {

	let lat : Double?
	let lon : Double?


	enum CodingKeys: String, CodingKey {
		case lat = "lat"
		case lon = "lon"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lon = try values.decodeIfPresent(Double.self, forKey: .lon)
	}


}
