//
//  ForecastPayload.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 05.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

struct ForecastPayload: Codable {
    let base : String?
    let clouds : Cloud?
    let cod : Int?
    let coord : Coord?
    let dt : Int?
    let id : Int?
    let main : Main?
    let name : String?
    let rain : Rain?
    let sys : Sy?
    let timezone : Int?
    let visibility : Int?
    let weather : [Weather]?
    let wind : Wind?
    
    
    enum CodingKeys: String, CodingKey {
        case base = "base"
        case clouds
        case cod = "cod"
        case coord
        case dt = "dt"
        case id = "id"
        case main
        case name = "name"
        case rain
        case sys
        case timezone = "timezone"
        case visibility = "visibility"
        case weather = "weather"
        case wind
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        base = try values.decodeIfPresent(String.self, forKey: .base)
        clouds = try values.decodeIfPresent(Cloud.self, forKey: .clouds)
        cod = try values.decodeIfPresent(Int.self, forKey: .cod)
        coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
        dt = try values.decodeIfPresent(Int.self, forKey: .dt)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        rain = try values.decodeIfPresent(Rain.self, forKey: .rain)
        sys = try values.decodeIfPresent(Sy.self, forKey: .sys)
        timezone = try values.decodeIfPresent(Int.self, forKey: .timezone)
        visibility = try values.decodeIfPresent(Int.self, forKey: .visibility)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
    }
}
