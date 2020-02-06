//
//  MainViewController.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 04.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var feedTableView: UITableView!
    
    // MARK: Model
    private var model: Feed!
    private var store: PersistenceProvider!
    
    // MARK: View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModel()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        feedTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        model.invalidateCache()
    }
}

// MARK: - Helpers
private extension MainViewController {
    func configureModel() {
        let forecastProvider = getForecastProvider()
        store = getPersistenceProvider()
        model = Feed(datastore: store, forecastProvider: forecastProvider)
    }
    
    func getPersistenceProvider() -> PersistenceProvider {
        let context = UIApplication.appDelegate.managedContext
        return DataStore(context: context)
    }
    
    func getForecastProvider() -> ForecastProvider {
        guard
            let key = Bundle.main.object(forInfoDictionaryKey: "WEATHER_API_KEY") as? String,
            let host = Bundle.main.object(forInfoDictionaryKey: "WEATHER_API_HOST") as? String else {
                fatalError("Project misconfiguration")
        }
        
        return ForecastService(host: host, apiKey: key)
    }
    
    func configureTableView() {
        feedTableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.totalLocations()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeCell() as FeedCell
        
        cell.request = model.forecastForLocation(at: indexPath.row) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let forecast):
                    cell.updateUI(with: forecast)
                default:
                    break
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.deleteLocation(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

