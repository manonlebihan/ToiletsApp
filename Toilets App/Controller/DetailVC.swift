//
//  DetailVC.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 18/11/2023.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var addressDetail: UILabel!
    @IBOutlet weak var openingHoursDetail: UILabel!
    @IBOutlet weak var prmAccessDetail: UILabel!
    @IBOutlet weak var distanceDetail: UILabel!
    
    var toilet: Record?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLabels()
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
        distanceDetail.text = "Distance"
    }
}
