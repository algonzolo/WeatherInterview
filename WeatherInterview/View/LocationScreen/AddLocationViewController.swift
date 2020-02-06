//
//  AddLocationViewController.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 07.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import UIKit
import MapKit

class AddLocationViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: IBActions
    @IBAction func confirm(_ sender: Any) {
        saveLocation()
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Helpers
private extension AddLocationViewController {
    func saveLocation() {
        let center = GPSLocation(location: mapView.centerCoordinate)
        let model = getPersistenceProvider()
        
        model.insert(location: center)
    }
    
    func getPersistenceProvider() -> PersistenceProvider {
        let context = UIApplication.appDelegate.managedContext
        return DataStore(context: context)
    }
}

private extension GPSLocation {
    init(location: CLLocationCoordinate2D) {
        latitude = location.latitude
        longitude = location.longitude
    }
}

