//
//  ViewController.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 16/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    var toilets: [Record] = []
    var filteredToilets: [Record] = []
    let id = "ToiletCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedUrl()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func toggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            filteredToilets = toilets.filter { $0.fields.accesPmr == "Oui" }
        } else {
            filteredToilets = toilets
        }
        tableView.reloadData()
    }
    
    func filterData() {
        if toggleSwitch.isOn {
            // Apply your filter criteria
            filteredToilets = toilets.filter { $0.fields.accesPmr == "Oui" }
        } else {
            // No filter, use original data
            filteredToilets = toilets
        }
        tableView.reloadData()
    }
    
    @IBAction func toggleSwitched(_ sender: Any) {
        filterData()
    }
    
    func receivedUrl() {
        APIHelper.shared.performRequest { toilets in
            DispatchQueue.main.async {
                self.toilets = toilets
                self.filteredToilets = toilets
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredToilets.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toilets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toilet = filteredToilets[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ToiletCell {
            cell.setup(toilet)
            return cell
        }
        return UITableViewCell()
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(toilets[indexPath.row].fields.adresse)
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
