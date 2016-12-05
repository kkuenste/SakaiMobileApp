//
//  OfficeHourViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/30/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class OfficeHourViewController: UIViewController {
    var course = ""
    
    @IBOutlet weak var courseLabel: UILabel!
    @IBAction func doneButton(_ sender: Any) {
       dismiss(animated: true, completion: nil) 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        courseLabel.text = course

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
