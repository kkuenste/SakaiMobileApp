//
//  ChildTableViewCell.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/29/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class ChildTableViewCell: UITableViewCell {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
