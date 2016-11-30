//
//  AssignmentsTableViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/6/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class AssignmentsTableViewController: UITableViewController {

    @IBAction func doneButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    let assignments = ["Assignment", "Assignment 1", "Assignment 2", "Assignment 3", "Assignment 4", "Assignment 5"]
    let dates = ["Due", "10/15 11:55PM", "10/20 5:00PM", "10/23 11:55PM", "10/25 11:55PM", "11/1 9:00AM"]
    let images = ["PDF","Assignment1", "Assignment1", "Assignment1", "Assignment1", "Assignment1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assignments.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "assignCell", for: indexPath)

            cell.selectionStyle = UITableViewCellSelectionStyle.none
        
            if let aCell = cell as? AssignmentTableViewCell  {
                aCell.nameLabel.text = assignments[indexPath.row]
                aCell.dateLabel.text = dates[indexPath.row]
                aCell.bottomBar.backgroundColor = #colorLiteral(red: 0.03206641227, green: 0.1726923287, blue: 0.3107052743, alpha: 1)
                if (indexPath.row == 0) {
                    aCell.nameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 17.0)
                    aCell.dateLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 17.0)
                    aCell.dateLabel.textAlignment = .center
                    aCell.pdfLabel.text = ""
                    
                }
            }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
