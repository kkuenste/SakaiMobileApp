//
//  LoginViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/1/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButtonView: UIView!
    @IBOutlet weak var forgotPasswordLabel: UIButton!
    
    @IBAction func forgotPasswordButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Email Sent", message: "Email has been sent with a link to reset your password.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBOutlet weak var netIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotPasswordLabel.titleLabel?.textColor = #colorLiteral(red: 0.02541817166, green: 0.1732199192, blue: 0.3195238113, alpha: 1)
        loginButtonView.layer.cornerRadius = 5
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
