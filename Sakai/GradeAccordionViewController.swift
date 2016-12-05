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
        
        self.tableView.separatorColor = #colorLiteral(red: 0.03206641227, green: 0.1726923287, blue: 0.3107052743, alpha: 1)
        
        let item0 = Parent(state: .collapsed, childs: [], score: ["5/5", "4/5", "3/5"], title: "Accountacy I")
        
        let item1 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], score: ["5/5", "4/5", "3/5"], title: "Accountacy I")
        let item2 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], score: ["5/5", "4/5", "3/5"],title: "Calculus II")
        let item3 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], score: ["5/5", "4/5", "3/5"],title: "Fundamentals of Computing I")
        let item4 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], score: ["5/5", "4/5", "3/5"],title: "General Chemisty Principles")
        let item5 = Parent(state: .collapsed, childs: ["Assignment 1", "Assignment 2", "Assignment 3"], score: ["5/5", "4/5", "3/5"], title: "Human Computer Interaction")
        self.dataSource = [item0, item1, item2, item3, item4, item5]
        self.numberOfCellsExpanded = .one
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
