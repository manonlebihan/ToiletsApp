//
//  ViewController.swift
//  Toilets App
//
//  Created by Manon Le Bihan on 16/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var toilets: [Record] = []
    let id = "ToiletCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedUrl()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func receivedUrl() {
        APIHelper.shared.performRequest { toilets in
            DispatchQueue.main.async {
                self.toilets = toilets
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toilets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toilet = toilets[indexPath.row]
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
        return 125
    }
}

