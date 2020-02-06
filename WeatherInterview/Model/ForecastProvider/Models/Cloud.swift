//
//	Cloud.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 06.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

struct Cloud : Codable {

	let all : Int?


	enum CodingKeys: String, CodingKey {
		case all = "all"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		all = try values.decodeIfPresent(Int.self, forKey: .all)
	}


}
