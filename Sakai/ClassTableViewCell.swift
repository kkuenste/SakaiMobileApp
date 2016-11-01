//
//  ClassTableViewCell.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/1/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    @IBOutlet weak var classImage: UIImageView!
    @IBOutlet weak var classNameLabel: UILabel!
    
    @IBOutlet weak var classNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
