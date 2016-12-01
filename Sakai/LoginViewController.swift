//
//  LoginViewController.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/1/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    //////Comment
    @IBOutlet weak var loginButtonView: UIView!
    @IBOutlet weak var forgotPasswordLabel: UIButton!
    
    @IBAction func forgotPasswordButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Reset Password", message: "Enter your email to receive a link to reset your password.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Send Email", style: UIAlertActionStyle.default, handler: nil))
        alert.view.tintColor = #colorLiteral(red: 0.02541817166, green: 0.1732199192, blue: 0.3195238113, alpha: 1)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Email"
            textField.delegate = self
        }
        
        
        let alert2 = UIAlertController(title: "Email Sent", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert2.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        alert2.view.tintColor = #colorLiteral(red: 0.02541817166, green: 0.1732199192, blue: 0.3195238113, alpha: 1)
        //self.present(alert2, animated: true, completion: nil)
        
        //self.present(alert, animated: true, completion: self.present(alert2, animated: true, completion: nil))
    }
    
    @IBOutlet weak var netIDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotPasswordLabel.titleLabel?.textColor = #colorLiteral(red: 0.02541817166, green: 0.1732199192, blue: 0.3195238113, alpha: 1)
        loginButtonView.layer.cornerRadius = 5
        passwordTextField.delegate = self
        netIDTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        netIDTextField.text = ""
        passwordTextField.text = ""
    }


}
