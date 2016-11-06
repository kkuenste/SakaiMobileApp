//
//  AnnouncementTableViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/6/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class AnnouncementTableViewController: UITableViewController {
    
    let subject = ["Class Canceled", "Office Hours Changed", "Exam 1 Scheduled", "Assignment 5 Posted", "Assignment 3 Graded"]
    let body = ["Class is canceled this Wednesday, I will be away at a conference.", "Office hours for next Friday have been canceled. Additional office hours arre being offer on Thursday at 4pm.", "The date for Exam 2 has been set for Wednesday November 9th. It will cover up through chapter 5.", "Assignment 5 has been posted. It is due next Tuesday.", "The grades for Assignment 3 have been posted. The average score was 50/60."]
    let date = ["Monday November 7th, 12:00PM", "Monday November 7th, 12:00PM", "Monday November 7th, 12:00PM", "Monday November 7th, 12:00PM", "Monday November 7th, 12:00PM"]

    @IBAction func donButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subject.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ACell", for: indexPath)
        
        if let aCell = cell as? AnnouncementTableViewCell  {
            aCell.subjectLabel.text = subject[indexPath.row]
            aCell.bodyLabel.text = body[indexPath.row]
            aCell.dateLabel.text = date[indexPath.row]
            if ((indexPath.row)%2 == 0) {
                aCell.colorView.backgroundColor = #colorLiteral(red: 0.8920779824, green: 0.9151738882, blue: 0.9310659766, alpha: 1)
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
