//
//  ViewController.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 16/11/2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var toilets: [Record] = []
    var filteredToilets: [Record] = []
    let id = "ToiletCell"
    let idDetail = "ToDetail"

    
    var manager: CLLocationManager = CLLocationManager()
    var currentUserLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchToiletData()
        tableView.delegate = self
        tableView.dataSource = self
        setupLocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == idDetail {
            if let detail = segue.destination as? DetailVC {
                detail.toilet = sender as? Record
            }
        }
    }
    
    @IBAction func toggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            filteredToilets = toilets.filter { $0.fields.accesPmr == "Oui" }
        } else {
            filteredToilets = toilets
        }
        tableView.reloadData()
    }
    
    func fetchToiletData() {
        APIHelper.shared.parseData { toilets in
            DispatchQueue.main.async {
                DataStorage.shared.toilets = toilets
                self.toilets = toilets
                self.filteredToilets = toilets
                self.tableView.reloadData()
            }
        }
    }
    
    /*func createLocation(_ geoPoint2d: [Double]) -> CLLocation? {
        guard geoPoint2d.count == 2 else { return nil }
        let lat = geoPoint2d[0]
        let lon = geoPoint2d[1]
        
        return CLLocation(latitude: lat, longitude: lon)
    }*/
    
    func distanceLocation(from userLocation: CLLocation, to point: [Double]) -> CLLocationDistance? {
        guard let targetLocation = LocationUtility.createLocation(point) else { return nil }
        return userLocation.distance(from: targetLocation)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredToilets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toilet = filteredToilets[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ToiletCell {
            cell.setup(toilet)
            if let userLocation = currentUserLocation {
                if let distance = distanceLocation(from: userLocation, to: toilet.fields.geoPoint2d) {
                    let distanceStr = "Distance : " + String(format: "%.2f km", distance / 1000)
                    cell.distance.text = distanceStr
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toilet = filteredToilets[indexPath.row]
        performSegue(withIdentifier: idDetail, sender: toilet)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension ViewController: CLLocationManagerDelegate {
     
    func setupLocation() {
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentUserLocation = locations.first
        tableView.reloadData()
    }
}
