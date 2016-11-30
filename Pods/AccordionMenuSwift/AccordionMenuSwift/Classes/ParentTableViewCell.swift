//
//  ParentTableViewCell.swift
//  Pods
//
//  Created by Katie Kuenster on 11/29/16.
//
//

import UIKit

class ParentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var plusView: plusView!
    @IBOutlet weak var minusView: minusView!
    
    override func awakeFromNib() {
        weak var minusView: minusView!
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
