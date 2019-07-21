//
//  MainTableViewController.swift
//  noodle-doo
//
//  Created by Jake Stanger on 7/16/19.
//  Copyright © 2019 Jake Stanger. All rights reserved.
//

import UIKit

enum sex: String {
    case male
    case female
}

struct reptile {
    var name: String
    var birthDate: String
    var sex: sex
}

let segueID: String = "reptileDetail"

class reptileTableViewCell: UITableViewCell {
    //the label stuff here
    @IBOutlet weak var reptileName: UILabel!
    @IBOutlet weak var subName: UILabel!
}

class MainTableViewController: UITableViewController, CanReceiveData {
    func dataReceived(data: String) {
        //TODO figure out what to do with data received
    }
    
    
    var listOfReptiles = [
        reptile(name: "Drax", birthDate: "5/5/5", sex: .male),
        reptile(name: "gimli", birthDate: "5/5/5", sex: .male),
        reptile(name: "Jar-Jar", birthDate: "5/5/5", sex: .female)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let rep1 = reptile.init(name: "Drax", birthDate: "5/5/05", sex: .male)
        print(rep1)
        
        print(listOfReptiles.count)
        
        
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfReptiles.count
    }
    
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! reptileTableViewCell
        let rep1 = listOfReptiles[indexPath.row]
//        cell.reptileName?.text = "Section \(indexPath.section) Row \(indexPath.row)"
//        cell.subName?.text = "blue blue blue"
        cell.reptileName?.text = rep1.name
        cell.subName?.text = rep1.sex.rawValue
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do stuff
        print("this row was pressed: \(indexPath.row) from this section \(indexPath.section)")
        let singleReptile = listOfReptiles[indexPath.row]
        print(singleReptile)
        
        performSegue(withIdentifier: segueID, sender: self)
    }
    
    
    
    
    
    //TODO: add prepare for segue
    
    
    //TODO: pass data! 

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */


    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }


//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        print("some rearranging has happened")
        print("fromIndexPath: \(fromIndexPath.row) to this indexpath: \(to.row)")
    }
 

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == segueID {
            let detailVC = segue.destination as! DetailViewController
            detailVC.data = "blah"
            
            detailVC.delegate = self
        }
    }

}
