//
//  ClassTableViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/1/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class ClassTableViewController: UITableViewController {
    
    @IBAction func Logout(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    var navBar: UINavigationBar = UINavigationBar()
    
    let courseNames = ["Accountancy I", "Calculus II", "Fundamentals of Computing I", "General Chemistry Principles", "Human Computer Interaction"]
    let courseNumbers = ["ACCT20100", "MATH10560", "CSE20211", "CHEM10122", "CSE40424"]
    let courseImages = ["bank", "math", "computer", "chemistry", "design"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.separatorColor = #colorLiteral(red: 0.03206641227, green: 0.1726923287, blue: 0.3107052743, alpha: 1)
        self.tableView.separatorColor = #colorLiteral(red: 0.6877453923, green: 0.5632880926, blue: 0.3085308671, alpha: 1)
        tableView.alwaysBounceVertical = false
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let classCell = cell as? ClassTableViewCell  {
            classCell.classNameLabel.text = courseNames[indexPath.row]
            classCell.classNumberLabel.text = courseNumbers[indexPath.row]
            classCell.classImage.image = UIImage(named: courseImages[indexPath.row])
        }
        
        let colorView = UIView()
        colorView.backgroundColor = #colorLiteral(red: 0.8921611309, green: 0.9120418429, blue: 0.9278852344, alpha: 1)
        cell.selectedBackgroundView = colorView
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell

    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
        if let dest = segue.destination as? ClassDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
                dest.courseName = courseNames[indexPath.row]
                dest.courseNumber = courseNumbers[indexPath.row]
                dest.courseImage = courseImages[indexPath.row]
            }
    }


}
