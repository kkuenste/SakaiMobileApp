//
//  ClassGradeTableViewCell.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/3/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class ClassGradeTableViewCell: UITableViewCell {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!

    @IBOutlet weak var percentLabel: UILabel!
    @IBAction func commentButton(_ sender: Any) {
        let alert = UIAlertController(title: "\(itemLabel.text!) Comments", message: "Good work.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        alert.view.tintColor = #colorLiteral(red: 0.02541817166, green: 0.1732199192, blue: 0.3195238113, alpha: 1)
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(alert, animated: true, completion: nil)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
