//
//  UITableView.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 04.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeCell<Cell: UITableViewCell>() -> Cell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.className) as? Cell else {
            fatalError("Project misconfiguration")
        }
        return cell
    }
}
