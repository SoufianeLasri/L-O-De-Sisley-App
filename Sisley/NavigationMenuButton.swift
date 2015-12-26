//
//  NavigationMenuButton.swift
//  Sisley
//
//  Created by Soufiane Lasri on 21/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class NavigationMenuButton: UIButton {
    
    var strokeColorAnimation: CABasicAnimation = CABasicAnimation()
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.backgroundColor    = UIColor.whiteColor()
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth  = 2.0
        self.layer.borderColor  = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 ).CGColor
        
        let horizontalLinePath = UIBezierPath()
        horizontalLinePath.moveToPoint( CGPoint( x: self.frame.width / 2 - 8, y: self.frame.height / 2 ) )
        horizontalLinePath.addLineToPoint( CGPoint( x: self.frame.width / 2 + 8, y: self.frame.height / 2 ) )
        
        let horizontalLine         = CAShapeLayer()
        horizontalLine.path        = horizontalLinePath.CGPath
        horizontalLine.lineWidth   = 2.0
        horizontalLine.lineCap     = kCALineJoinRound
        horizontalLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ).CGColor
        self.layer.addSublayer( horizontalLine )
        
        let verticalLinePath = UIBezierPath()
        verticalLinePath.moveToPoint( CGPoint( x: self.frame.width / 2, y: self.frame.height / 2 - 8 ) )
        verticalLinePath.addLineToPoint( CGPoint( x: self.frame.width / 2, y: self.frame.height / 2 + 8 ) )
        
        let verticalLine         = CAShapeLayer()
        verticalLine.path        = verticalLinePath.CGPath
        verticalLine.lineWidth   = 2.0
        verticalLine.lineCap     = kCALineJoinRound
        verticalLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ).CGColor
        self.layer.addSublayer( verticalLine )
        
        self.strokeColorAnimation           = CABasicAnimation(keyPath: "strokeColor")
        self.strokeColorAnimation.fromValue = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ).CGColor
        self.strokeColorAnimation.toValue   = UIColor.whiteColor().CGColor
        self.strokeColorAnimation.duration  = 0.3
        self.strokeColorAnimation.removedOnCompletion = false
        self.strokeColorAnimation.fillMode  = kCAFillModeBoth
    }
    
    func toggleButton( openingState: Bool ) {
        if openingState == true {
            self.layer.transform = CATransform3DMakeRotation( CGFloat( M_PI ) / 4, 0.0, 0.0, 1.0 )
            self.backgroundColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
            
            for item in self.layer.sublayers! {
                item.addAnimation( self.strokeColorAnimation, forKey: "strokeColor" )
            }
        } else {
            self.layer.transform = CATransform3DMakeRotation( 0.0, 0.0, 0.0, 1.0 )
            self.backgroundColor = UIColor.whiteColor()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}