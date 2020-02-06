//
//	Rain.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 06.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//


import Foundation

struct Rain : Codable {

	let hour : Double?


	enum CodingKeys: String, CodingKey {
		case hour = "1h"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		hour = try values.decodeIfPresent(Double.self, forKey: .hour)
	}


}
