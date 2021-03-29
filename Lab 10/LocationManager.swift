//
//  LocationManager.swift
//  Lab 10
//
//  Created by ICS 224 on 2021-03-23.
//

import SwiftUI
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var locationManager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    func startLocationService(){
        print("***** Location updates starting")
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationService() {
        print("***** Location updates stopping")
        locationManager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedAlways ||
            manager.authorizationStatus == .authorizedWhenInUse {
            print("***** Location updates authorized")
            startLocationService()
        } else {
            print("***** Location updates unauthorized")
            stopLocationService()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("***** Location updates failed with error: \(error)")
        location = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("****** Location updated")
        if let location = locations.last {
            self.location = location.coordinate
            self.region.center.latitude = location.coordinate.latitude
            self.region.center.longitude = location.coordinate.longitude
        }
    }
}
