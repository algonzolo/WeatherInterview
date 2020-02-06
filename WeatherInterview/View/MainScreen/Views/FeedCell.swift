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
    @IBOutlet weak var weather: UILabel!
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
    
    func updateUI(with forecast: Forecast) {
        timezone.text = "\(forecast.timezone)"
        coords.text = "\(forecast.latitude) \(forecast.longitude)"
        summary.text = "\(forecast.summary)"
        weather.text = "\(forecast.forecast)"
        temperature.text = "\(forecast.temperature)"
        windSpeed.text = "\(forecast.windSpeed)"
        humidity.text = "\(forecast.humidity)"
    }

    }

// MARK: - Helpers
private extension FeedCell {
    func clear() {
        timezone.text = ""
        coords.text = ""
        summary.text = ""
        weather.text = ""
        temperature.text = ""
        windSpeed.text = ""
        humidity.text = ""
    }
}
