//
//  SectionHeaderView.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/6/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

protocol SectionHeaderViewDelegate {
    func sectionHeaderView(sectionHeaderView: SectionHeaderView, sectionOpened: Int)
    func sectionHeaderView(sectionHeaderView: SectionHeaderView, sectionClosed: Int)
}

class SectionHeaderView: UITableViewHeaderFooterView {
    
    var section: Int?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var disclosureButton: UIButton!
    @IBAction func toggleOpen() {
        self.toggleOpenWithUserAction(userAction: true)
    }
    var delegate: SectionHeaderViewDelegate?
    
    func toggleOpenWithUserAction(userAction: Bool) {
        self.disclosureButton.isSelected = !self.disclosureButton.isSelected
        
        if userAction {
            if self.disclosureButton.isSelected {
                self.delegate?.sectionHeaderView(sectionHeaderView: self, sectionClosed: self.section!)
            } else {
                self.delegate?.sectionHeaderView(sectionHeaderView: self, sectionOpened: self.section!)

            }
        }
    }
    
    override func awakeFromNib() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SectionHeaderView.toggleOpen))
        self.addGestureRecognizer(tapGesture)
        // change the button image here, you can also set image via IB.
        self.disclosureButton.setImage(UIImage(named: "arrow_up"), for: UIControlState.selected)
        self.disclosureButton.setImage(UIImage(named: "arrow_down"), for: UIControlState.normal)
    }
    
}
