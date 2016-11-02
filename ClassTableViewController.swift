//
//  ClassTableViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/1/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class ClassTableViewController: UITableViewController {
    
    var navBar: UINavigationBar = UINavigationBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.alwaysBounceVertical = false
        tableView.isScrollEnabled = false
        //self.navBar.frame = CGRect(0, 0, 320, 50)  // Here you can set you Width and Height for your navBar
        //self.navBar.setBackgroundImage(backgroundImage: UIImage(named: "banner"), for: UIBarMetrics)
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "banner"), for: .default)
        self.navBar.backgroundColor = (UIColor.blue)
        self.view.addSubview(navBar)
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
            if (indexPath.row == 4) {
                classCell.classNameLabel.text = "Human Computer Interaction"
                classCell.classImage.image = UIImage(named: "design")
                classCell.classNumberLabel.text = "CSE40424"
            }
            else if (indexPath.row == 3) {
                classCell.classNameLabel.text = "General Chemistry Principles"
                classCell.classImage.image = UIImage(named: "chemistry")
                classCell.classNumberLabel.text = "CHEM10122"
            }
            else if (indexPath.row == 2) {
                classCell.classNameLabel.text = "Fundamentals of Computing I"
                classCell.classImage.image = UIImage(named: "computer")
                classCell.classNumberLabel.text = "CSE20211"
            }
            else if (indexPath.row == 1) {
                classCell.classNameLabel.text = "Calculus II"
                classCell.classImage.image = UIImage(named: "math")
                classCell.classNumberLabel.text = "MATH10560"
            }
            else if (indexPath.row == 0) {
                classCell.classNameLabel.text = "Accountancy I"
                classCell.classImage.image = UIImage(named: "bank")
                classCell.classNumberLabel.text = "ACCT20100"
            }
            else {
                classCell.backgroundColor = UIColor.lightGray
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
