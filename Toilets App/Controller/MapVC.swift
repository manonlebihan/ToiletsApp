//
//  MapVC.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 18/11/2023.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    var allToilets: [Record] = DataStorage.shared.toilets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnnotations()
        zoomMapToFitAnnotations()
    }
    
    func loadAnnotations() {
        allToilets = DataStorage.shared.toilets
        allToilets.forEach { toilet in
            let anno = ToiletAnnotation(toilet)
            map.addAnnotation(anno)
        }
    }
    
    func zoomMapToFitAnnotations() {
        guard !map.annotations.isEmpty else { return }

            var zoomRect = MKMapRect.null
            for annotation in map.annotations {
            let annotationPoint = MKMapPoint(annotation.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0.1, height: 0.1)
                zoomRect = zoomRect.union(pointRect)
            }
            map.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100), animated: true)
    }
}
