//
//  LocationManager.swift
//  LocationTracker
//
//  Created by Abdullah Mamun on 30/6/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    static func getInstance() -> LocationManager {
        return shared
    }
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        let locCenter = CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417)
        let region = CLCircularRegion(center: locCenter, radius: locationManager.maximumRegionMonitoringDistance, identifier: "Jamuna future park")
        locationManager.startMonitoring(for: region)
    }
    
    func monitorLocation() {
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationObj = locations.first! as CLLocation
        print("lat = \(locationObj.coordinate.latitude)")
        print("lon = \(locationObj.coordinate.longitude)")
        print("alt = \(locationObj.altitude)")
        locationManager.delegate = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("Start monitoring for region")
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Did enter region")
        //Add code to save office entry
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Did exit region")
        //Add code to same office exit
    }
}
