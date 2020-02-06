//
//  DataStore.swift
//  WeatherInterview
//
//  Created by Albert Garipov on 07.02.2020.
//  Copyright © 2020 Albert Garipov. All rights reserved.
//

import Foundation
import CoreData

class DataStore {
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

// MARK: - PersistenceProviding
extension DataStore: PersistenceProvider {
    func locationsCount() -> Int {
        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
        guard let count = try? context.count(for: fetchRequest) else {
            fatalError("Check project configuration")
        }
        
        return count
    }
    
    func location(at index: Int) -> GPSLocation {
        let loc = fetchLocations()[index]
        return GPSLocation(managedObject: loc)
    }
    
    func deleteLocation(at index: Int) {
        let loc = fetchLocations()[index]
        context.delete(loc)
        try? context.save()
    }
    
    func insert(location: GPSLocation) {
        let object = Location(context: context)
        object.latitude = location.latitude
        object.longitude = location.longitude
        object.creationTime = Date()
        context.insert(object)
        try? context.save()
    }
}

// MARK: - Helpers
private extension DataStore {
    func fetchLocations() -> [Location] {
        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Location.creationTime), ascending: true)
        
        fetchRequest.sortDescriptors = [sort]
        guard let locations = try? context.fetch(fetchRequest) else {
            fatalError("Check project configuration")
        }
        return locations
    }
}

