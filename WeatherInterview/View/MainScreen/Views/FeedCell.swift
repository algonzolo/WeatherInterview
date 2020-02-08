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
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var coords: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var country: UILabel!
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
        title.text = forecast.name
        coords.text = "\(forecast.latitude), \(forecast.longitude)"
        summary.text = "\(forecast.summary)"
        country.text = "\(forecast.country)".flagEmoji
        temperature.text = String(format: "%.1f", forecast.temperature) + "°C"
        windSpeed.text = "\(forecast.windSpeed)" + " m/s"
        humidity.text = "\(Int(forecast.humidity))" + " %"
    }

    }

// MARK: - Helpers
private extension FeedCell {
    func clear() {
        title.text = ""
        coords.text = ""
        summary.text = ""
        country.text = ""
        temperature.text = ""
        windSpeed.text = ""
        humidity.text = ""
    }
}
