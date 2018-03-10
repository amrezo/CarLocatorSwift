//
//  LocationsTableViewController.swift
//  CarLocator
//
//  Created by Amr Al-Refae on 3/10/18.
//  Copyright © 2018 Amr Al-Refae. All rights reserved.
//

import UIKit
import RealmSwift

class LocationsTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Init realm
        realm = try! Realm()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // When the location list is empty, display the placeholder
        if locations.count == 0 {
            
            // Placeholder creation, displayed when the tableView is empty
            let placeholderTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            placeholderTitle.font = UIFont(name: "Avenir Next", size: CGFloat(integerLiteral: 27))
            placeholderTitle.numberOfLines = 2
            placeholderTitle.textColor = .black
            placeholderTitle.center = CGPoint(x: 160, y: 284)
            placeholderTitle.textAlignment = .center
            placeholderTitle.text = "You don't have any saved locations."
            
            // Remove separation line in tableView and add placeholder to its backgroundView
            tableView.separatorStyle = .none
            tableView.backgroundView = placeholderTitle
            
        } else {
            
            // Reset tableView to original settings and remove separatipn line in empty cells
            tableView.backgroundView = UIView()
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .singleLine
        }
        
        //Number of sections in this locations list
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)

        let locationItem = locations[indexPath.row]
        
        cell.textLabel?.text = locationItem.title

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let locationItem = locations[indexPath.row]
            
            try! realm.write({
                
                realm.delete(locationItem)
            })
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
        }
    }
    

}
