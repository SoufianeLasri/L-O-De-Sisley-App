//
//  CustomTitle.swift
//  Sisley
//
//  Created by Soufiane Lasri on 01/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CustomTitle: UILabel {
    init( frame: CGRect, color: UIColor) {
        super.init( frame: frame )
        
        let color = color
        
        let linePath = UIBezierPath()
        linePath.moveToPoint( CGPoint( x: self.frame.width / 2 - 35, y: self.frame.height + 15 ) )
        linePath.addLineToPoint( CGPoint( x: self.frame.width / 2 + 35, y: self.frame.height + 15 ) )
        
        let line = CAShapeLayer()
        line.path = linePath.CGPath
        line.lineWidth = 1.0
        line.lineCap = kCALineJoinRound
        line.strokeColor = color.CGColor
        
        self.layer.addSublayer( line )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
