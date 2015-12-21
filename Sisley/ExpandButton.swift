//
//  ExpandButton.swift
//  Sisley
//
//  Created by Soufiane Lasri on 21/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class ExpandButton: UIButton {
    var verticalLine: CAShapeLayer = CAShapeLayer()
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 ).CGColor
        
        let linePath = UIBezierPath()
        linePath.moveToPoint( CGPoint( x: self.frame.width / 2 - 12.5, y: self.frame.height / 2 ) )
        linePath.addLineToPoint( CGPoint( x: self.frame.width / 2 + 12.5, y: self.frame.height / 2 ) )
        
        let horizontalLine = CAShapeLayer()
        horizontalLine.path = linePath.CGPath
        horizontalLine.lineWidth = 3.0
        horizontalLine.lineJoin = kCALineJoinRound
        horizontalLine.lineCap = kCALineJoinRound
        horizontalLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ).CGColor
        self.layer.addSublayer( horizontalLine )
        
        self.verticalLine = CAShapeLayer()
        self.verticalLine.path = linePath.CGPath
        self.verticalLine.anchorPoint = CGPointMake( 1.0, 1.0 )
        self.verticalLine.lineWidth = 3.0
        self.verticalLine.lineCap = kCALineJoinRound
        self.verticalLine.bounds = self.bounds
        self.verticalLine.position = CGPointMake( self.frame.width / 2, self.frame.height / 2 )
        self.verticalLine.anchorPoint = CGPointMake( 0.5, 0.5 )
        self.verticalLine.transform = CATransform3DMakeRotation( CGFloat( M_PI ) / 2, 0.0, 0.0, 1.0 )
        self.verticalLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ).CGColor
        self.layer.addSublayer( self.verticalLine )
    }
    
    func toggleButton( openingState: Bool ) {
        if openingState == true {
            self.verticalLine.transform = CATransform3DMakeRotation( 0.0, 0.0, 0.0, 1.0 )
            self.backgroundColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        } else {
            self.verticalLine.transform = CATransform3DMakeRotation( CGFloat( M_PI ) / 2, 0.0, 0.0, 1.0 )
            self.backgroundColor = UIColor.whiteColor()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}