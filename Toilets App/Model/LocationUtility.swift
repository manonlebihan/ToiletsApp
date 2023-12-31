//
//  LocationUtility.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 19/11/2023.
//

import Foundation
import CoreLocation

class LocationUtility {
    
    static func createLocation(_ geoPoint2d: [Double]) -> CLLocation? {
        guard geoPoint2d.count == 2 else { return nil }
        return CLLocation(latitude: geoPoint2d[0], longitude: geoPoint2d[1])
    }
    
     static func distanceLocation(from userLocation: CLLocation, to point: [Double]) -> CLLocationDistance? {
        guard let targetLocation = LocationUtility.createLocation(point) else { return nil }
        return userLocation.distance(from: targetLocation)
    }

}
