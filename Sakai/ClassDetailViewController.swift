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
    override func viewDidLoad() {
        super.viewDidLoad()
        syllabusDetailView.layer.cornerRadius = 10
        syllabusDetailView.setNeedsDisplay()
        syllabusDetailView.setNeedsLayout()

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
