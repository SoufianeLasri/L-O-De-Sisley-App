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
    var openAnimation: CABasicAnimation = CABasicAnimation()
    var closeAnimation: CABasicAnimation = CABasicAnimation()
    
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
//        self.verticalLine.strokeColor = UIColor.redColor().CGColor
        self.verticalLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ).CGColor
        self.layer.addSublayer( self.verticalLine )
        
        self.openAnimation           = CABasicAnimation( keyPath: "transform.rotation" )
        self.openAnimation.duration  = 0.3
        self.openAnimation.fromValue = 0.0
        self.openAnimation.toValue   = M_PI / 180.0 * 90.0
        
        self.closeAnimation           = CABasicAnimation( keyPath: "transform.rotation" )
        self.closeAnimation.duration  = 0.3
        self.closeAnimation.fromValue = M_PI / 180.0 * 90.0
        self.closeAnimation.toValue   = 0.0
    }
    
    func toggleButton( openingState: Bool ) {
        if openingState == true {
//            self.verticalLine.addAnimation( self.openAnimation, forKey: "rotate" )
            self.verticalLine.transform = CATransform3DMakeRotation( 0.0, 0.0, 0.0, 1.0 )
            self.backgroundColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        } else {
//            self.verticalLine.addAnimation( self.closeAnimation, forKey: "rotate" )
            self.verticalLine.transform = CATransform3DMakeRotation( CGFloat( M_PI ) / 2, 0.0, 0.0, 1.0 )
            self.backgroundColor = UIColor.whiteColor()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}