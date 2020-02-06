//
//	Sy.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 06.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//


import Foundation

struct Sy : Codable {

	let country : String?
	let id : Int?
	let sunrise : Int?
	let sunset : Int?
	let type : Int?


	enum CodingKeys: String, CodingKey {
		case country = "country"
		case id = "id"
		case sunrise = "sunrise"
		case sunset = "sunset"
		case type = "type"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		sunrise = try values.decodeIfPresent(Int.self, forKey: .sunrise)
		sunset = try values.decodeIfPresent(Int.self, forKey: .sunset)
		type = try values.decodeIfPresent(Int.self, forKey: .type)
	}


}
