//
//  ClassDetailViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/2/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController {

    @IBOutlet weak var syllabusDetailView: UIView!
    @IBOutlet weak var gradesDetailView: UIView!
    @IBOutlet weak var assignmentsDetailView: UIView!
    @IBOutlet weak var resourcesDetailView: UIView!
    @IBOutlet weak var announcementsDetailView: UIView!
    @IBOutlet weak var officeHoursDetailView: UIView!
    
    var courseName = ""
    var courseNumber = ""
    var courseImage = ""
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseNumberLabel: UILabel!

    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syllabusDetailView.layer.cornerRadius = 10
        gradesDetailView.layer.cornerRadius = 10
        officeHoursDetailView.layer.cornerRadius = 10
        assignmentsDetailView.layer.cornerRadius = 10
        resourcesDetailView.layer.cornerRadius = 10
        announcementsDetailView.layer.cornerRadius = 10
        courseNameLabel.text = courseName
        courseNumberLabel.text = courseNumber
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gradeSegue" {            
            if let dest = segue.destination as? UINavigationController {
                if let targetController = dest.topViewController as? ClassGradeTableViewController {
                    targetController.course = courseName
                }
            }
        }
        if segue.identifier == "announcementSegue" {
            if let dest = segue.destination as? UINavigationController {
                if let targetController = dest.topViewController as? AnnouncementTableViewController {
                    targetController.course = courseName
                }
            }
        }
        if segue.identifier == "assignmentSegue" {
            if let dest = segue.destination as? UINavigationController {
                if let targetController = dest.topViewController as? AssignmentsTableViewController {
                    targetController.course = courseName
                }
            }
        }
        if segue.identifier == "resourceSegue" {
            if let dest = segue.destination as? UINavigationController {
                if let targetController = dest.topViewController as? ResourceViewController {
                    targetController.courseName = courseName
                }
            }
        }
        if segue.identifier == "officeSegue" {
            if let dest = segue.destination as? UINavigationController {
                if let targetController = dest.topViewController as? OfficeHourViewController {
                    targetController.course = courseName
                }
            }
        }
        
    }
 

}
