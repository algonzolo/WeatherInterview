//
//  LocationHeaderView.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 04.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    // MARK: IBOutlets
    @IBOutlet weak var timezone: UILabel!
    @IBOutlet weak var coords: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var forecast: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var humidity: UILabel!
    
    // MARK: Model
    var request: Cancelable?
    
    // MARK: Public methods
    override func prepareForReuse() {
        super.prepareForReuse()
        request?.cancel()
        clear()
    }
    
    func updateUI() {

    }
}

// MARK: - Helpers
private extension FeedCell {
    func clear() {

    }
}
