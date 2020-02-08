//
//  String+Ext.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 08.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

extension String {
    var flagEmoji: String {
        let base: UInt32 = 127397
        var s = ""
        for v in uppercased().unicodeScalars { s.unicodeScalars.append(UnicodeScalar(base + v.value)!) }
        return s
    }
}
