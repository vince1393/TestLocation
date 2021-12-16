//
//  LocationManager.swift
//  TestLocation
//
//  Created by Vincent Romani on 2021-12-15.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager: CLLocationManager
    @Published var locations: [Location] = []
    
    static let shared = LocationManager()
    
    override init() {
        locationManager = CLLocationManager()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 5
        
        locationManager.requestAlwaysAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        
        super.init()
        locationManager.delegate = self
        locationManager.activityType = .fitness
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let myLocations = locations.map { Location(location: $0, date: Date.now) }
        self.locations.append(contentsOf: myLocations)
        print("Location Updated")
    }
}

struct Location: Hashable {
    var location: CLLocation
    var date: Date
}

