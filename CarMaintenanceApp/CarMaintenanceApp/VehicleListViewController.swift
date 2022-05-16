//
//  ViewController.swift
//  CarMaintenanceApp
//
//  Created by emil on 4/27/22.
//

import UIKit

class VehicleListViewController: UITableViewController {

    var itemArray = [Vehicle]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newVehicle = Vehicle()
        newVehicle.title = "Tesla Model Y"
        itemArray.append(newVehicle)
        
        let newVehicle2 = Vehicle()
        newVehicle2.title = "Honda CBR300"
        itemArray.append(newVehicle2)
        
        let newVehicle3 = Vehicle()
        newVehicle3.title = "Go Kart 300"
        itemArray.append(newVehicle3)
        
//        if let items = defaults.array(forKey: "PersistedVehicleListArray") as? [Vehicle] {
//            itemArray = items
//        }
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Vehicle", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newVehicle = Vehicle()
            newVehicle.title = textField.text!
            
            self.itemArray.append(newVehicle)
            
            self.saveItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        
        do{
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
}

