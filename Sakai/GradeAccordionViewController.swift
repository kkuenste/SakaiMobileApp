//
//  GradeAccordionViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/29/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit
import AccordionMenuSwift

class GradeAccordionViewController: AccordionTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], title: "Accountacy I")
        let item2 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], title: "Calculus II")
        let item3 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], title: "Fundamentals of Computing I")
        let item4 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], title: "General Chemisty Principles")
        let item5 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], title: "Human Computer Interaction")
        
        self.dataSource = [item1, item2, item3, item4, item5]
        self.numberOfCellsExpanded = .one
        // Do any additional setup after loading the view.
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
