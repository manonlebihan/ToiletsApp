//
//  ToiletAnnotation.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 18/11/2023.
//

import Foundation
import MapKit

class ToiletAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(_ toilet: Record) {
        self.title = toilet.fields.adresse ?? "Unknown"
        if toilet.fields.geoPoint2d.count == 2 {
            let latitude = toilet.fields.geoPoint2d[0]
            let longitude = toilet.fields.geoPoint2d[1]
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
        super.init()
    }
}
