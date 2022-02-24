//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Tcheng, James (BJH) on 24/02/2022.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate, ObservableObject{
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    @Published var lastKnownLocation: String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: {(placemarks, error) in
                if error != nil{
                    self.lastKnownLocation = "Could not perform lookup of location from coordinate information"
                } else{
                    if let firstPlacemark = placemarks?[0]{
                        
                        let country = firstPlacemark.country ?? "Couldn't find sublocality"
                        let city = firstPlacemark.locality ?? "Couldn't find locality"
                        let subCity = firstPlacemark.subLocality ?? "Couldn't find sublocality"
                        let street = firstPlacemark.thoroughfare ?? "Couldn't find sublocality"
                        let subStreet = firstPlacemark.subThoroughfare ?? "Couldn't find sublocality"
                        let postalCode = firstPlacemark.postalCode ?? "Couldn't find sublocality"
                        self.lastKnownLocation = "\(country), \(city)\n \(subCity), \(street), \(subStreet)\n \(postalCode)"
                        
                        
                    }
                }
            })
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        lastKnownLocation = "Error finding location"
    }
}
