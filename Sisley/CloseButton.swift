//
//  CloseButton.swift
//  Sisley
//
//  Created by Soufiane Lasri on 30/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CloseButton: UIButton {
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        let crossPath = UIBezierPath()
        crossPath.moveToPoint( CGPoint( x: self.frame.width / 2 - 5, y: self.frame.height / 2 - 5 ) )
        crossPath.addLineToPoint( CGPoint( x: self.frame.width / 2 + 5, y: self.frame.height / 2 + 5 ) )
        crossPath.moveToPoint( CGPoint( x: self.frame.width / 2 + 5, y: self.frame.height / 2 - 5 ) )
        crossPath.addLineToPoint( CGPoint( x: self.frame.width / 2 - 5, y: self.frame.height / 2 + 5 ) )
        
        let crossLine         = CAShapeLayer()
        crossLine.path        = crossPath.CGPath
        crossLine.lineWidth   = 2.0
        crossLine.lineCap     = kCALineJoinRound
        crossLine.strokeColor = UIColor.whiteColor().CGColor
        self.layer.addSublayer( crossLine )
        
        self.alpha = 0.5
    }
    
    func toggleButton( openingState: Bool ) {
        if openingState == true {
            self.alpha = 0.5
            self.enabled = true
        } else {
            self.alpha = 0.0
            self.enabled = false
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
