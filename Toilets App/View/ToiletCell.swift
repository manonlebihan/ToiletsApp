//
//  ToiletCell.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 16/11/2023.
//

import UIKit

class ToiletCell: UITableViewCell {
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var openingHours: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var prmAccess: UILabel!

    var toilet: Record!
    
    func setup(_ newToilet: Record) {
        toilet = newToilet
        if let address = toilet.fields.adresse {
            self.addressLbl.text = address + ", \(toilet.fields.arrondissement)"
        } else {
            self.addressLbl.text = "Non renseigné"
        }
        if let openingHours = toilet.fields.horaire {
            if openingHours == "Voir fiche équipement" {
                self.openingHours.text = "Horaires d'ouverture : Non renseigné"
            } else {
                self.openingHours.text = "Horaires d'ouverture : \(openingHours)"
            }
        } else {
            self.openingHours.text = "Horaires d'ouverture : Non renseigné"
        }
        self.distance.text = "Distance"
        if let prmAccess = toilet.fields.accesPmr {
            self.prmAccess.text = "Accès PMR : \(prmAccess)"
        } else {
            self.prmAccess.text = "Pas d'infos"
        }
    }
}
