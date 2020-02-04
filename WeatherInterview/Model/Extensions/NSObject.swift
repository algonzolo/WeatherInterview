//
//  NSObject.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 04.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String {
        guard let result = String(describing: self).components(separatedBy: ".").last else {
            return String(describing: self)
        }
        return result
    }
    
    var className: String {
         return type(of: self).className
    }
}
