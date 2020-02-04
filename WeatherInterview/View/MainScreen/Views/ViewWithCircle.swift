//
//  ViewWithCircle.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 04.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import UIKit

@IBDesignable
class ViewWithCircle: UIView {
    
    @IBInspectable
    var color: UIColor = .clear

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override func draw(_ rect: CGRect) {
        if let layer = self.layer as? CAShapeLayer {
            layer.path = UIBezierPath(ovalIn: rect).cgPath
            layer.fillColor = color.cgColor
        }
        super.draw(rect)
    }

}
