//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Tcheng, James (BJH) on 24/02/2022.
//

import Foundation
import CoreLocation

class LocationHandler{
    let manager = CLLocationManager()
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
}
