//
//  ValidateButton.swift
//  Sisley
//
//  Created by Soufiane Lasri on 29/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class ValidateButton: UIButton {
    init( frame: CGRect, color: UIColor ) {
        super.init( frame: frame )
        
        self.backgroundColor = color
        self.layer.cornerRadius = self.frame.width / 2
        
        let validatePath = UIBezierPath()
        validatePath.moveToPoint( CGPoint( x: self.frame.width / 2 - 10, y: self.frame.height / 2 ) )
        validatePath.addLineToPoint( CGPoint( x: self.frame.width / 2 - 2, y: self.frame.height / 2 + 7 ) )
        validatePath.addLineToPoint( CGPoint( x: self.frame.width / 2 + 10, y: self.frame.height / 2 - 7 ) )
        
        let validateLayer         = CAShapeLayer()
        validateLayer.path        = validatePath.CGPath
        validateLayer.lineWidth   = 2.5
        validateLayer.lineCap     = kCALineJoinRound
        validateLayer.fillColor   = UIColor.clearColor().CGColor
        validateLayer.strokeColor = UIColor.whiteColor().CGColor
        self.layer.addSublayer( validateLayer )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}