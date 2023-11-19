//
//  DetailVC.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 18/11/2023.
//

import UIKit
import CoreLocation

class DetailVC: UIViewController {
    
    @IBOutlet weak var addressDetail: UILabel!
    @IBOutlet weak var openingHoursDetail: UILabel!
    @IBOutlet weak var prmAccessDetail: UILabel!
    @IBOutlet weak var distanceDetail: UILabel!
    
    var toilet: Record?
    
    var userLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLabels()
    }
    
    func createLocation(_ geoPoint2d: [Double]) -> CLLocation? {
            guard geoPoint2d.count == 2 else { return nil }
            return CLLocation(latitude: geoPoint2d[0], longitude: geoPoint2d[1])
    }
    
    func displayDistance() -> String {
        guard let toilet = toilet, let userLocation = userLocation, let toiletLocation = createLocation(toilet.fields.geoPoint2d) else {
            return "Distance : inconnue"
        }
        let distance = userLocation.distance(from: toiletLocation)
        let distanceInKilometers = distance / 1000
        return String(format: "Distance : %.2f km", distanceInKilometers)
    }
    
    func getLabels() {
        if let address = toilet?.fields.adresse, let district = toilet?.fields.arrondissement {
            addressDetail.text = "Localisation des toilettes : \n\(address), \(district)"
        } else {
            addressDetail.text = "Localisation des toilettes : \nNon renseigné"
        }
        if let openings = toilet?.fields.horaire {
            if openings == "Voir fiche équipement" {
                openingHoursDetail.text = "Horaires d'ouverture : \nNon renseigné"
            } else {
                openingHoursDetail.text = "Horaires d'ouverture : \n\(openings)"
            }
        } else {
            openingHoursDetail.text = "Horaires d'ouverture : \nNon renseigné"
        }
        if let prm = toilet?.fields.accesPmr {
            prmAccessDetail.text = "Accès personne à mobilité réduite (PMR) : \n\(prm)"
        } else {
            prmAccessDetail.text = "Accès personne à mobilité réduite (PMR) : \nNon renseigné"
        }
        let distance = displayDistance()
        distanceDetail.text = "\(distance)"
    }
}
