//
//  ResourceViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/30/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit
import AccordionMenuSwift

class ResourceViewController: AccordionTableViewController  {
    
    @IBAction func logoutButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = #colorLiteral(red: 0.03206641227, green: 0.1726923287, blue: 0.3107052743, alpha: 1)
        
        let item1 = Parent(state: .collapsed, childs: ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5"], score: ["5/5", "4/5", "3/5"], title: "Lecture Slides")
        let item2 = Parent(state: .collapsed, childs: ["Reading 1", "Reading 2", "Reading 3"], score: ["5/5", "4/5", "3/5"],title: "Readings")
        let item3 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3", "Assignment 4", "Assignment 5"], score: ["5/5", "4/5", "3/5"],title: "Assignments")
        let item4 = Parent(state: .collapsed, childs: ["Exam 1 Review", "Exam 2 Review", "Handout 3", "Presentation Topics"], score: ["5/5", "4/5", "3/5"],title: "Handouts")
        
        self.dataSource = [item1, item2, item3, item4]
        self.numberOfCellsExpanded = .one
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
