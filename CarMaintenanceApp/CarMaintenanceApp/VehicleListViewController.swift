//
//  ViewController.swift
//  CarMaintenanceApp
//
//  Created by emil on 4/27/22.
//

import UIKit

class VehicleListViewController: UITableViewController {

    let itemArray = ["Tesla Model Y","Honda Accord Hybrid","Honda Helix Couch",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    

    
}

