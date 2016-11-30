//
//  plusView.swift
//  Sakai
//
//  Created by Katie Kuenster on 11/29/16.
//  Copyright © 2016 HCI2016. All rights reserved.
//

import UIKit

class plusView: UIView {

    var plus = true

    override func draw(_ rect: CGRect) {
        
        #colorLiteral(red: 0.03206641227, green: 0.1726923287, blue: 0.3107052743, alpha: 1).setStroke()
        
        let center = CGPoint(x:12.5, y: 12.5)
        let point1 = CGPoint(x: center.x, y: center.y + 7)
        let point2 = CGPoint(x: center.x, y: center.y - 7)
        
        let point3 = CGPoint(x: center.x - 7, y: center.y)
        let point4 = CGPoint(x: center.x + 7, y: center.y)
        
        if plus {
            let vertical = UIBezierPath()
            vertical.lineWidth = 2.0
            vertical.move(to: point1)
            vertical.addLine(to: point2)
            vertical.stroke()
        }
        
        let horizontal = UIBezierPath()
        horizontal.lineWidth = 1.5
        horizontal.move(to: point3)
        horizontal.addLine(to: point4)
        horizontal.stroke()
        
    }


}
