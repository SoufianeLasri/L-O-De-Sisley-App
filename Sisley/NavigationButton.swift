//
//  NavigationButton.swift
//  Sisley
//
//  Created by Soufiane Lasri on 21/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
}

class NavigationButton: UIButton {
    
    init( frame: CGRect, text: String, imageName: String ) {
        super.init( frame: frame )
        
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 ).CGColor
        self.alpha = 0
        self.frame.origin.y += 5
        
        let labelView = UIView( frame: CGRectMake( 25, 0, 185, self.frame.height ) )
        labelView.backgroundColor = UIColor( red: 0.51, green: 0.54, blue: 0.68, alpha: 1 )
        labelView.roundCorners( [ .TopRight, .BottomRight ], radius: 10.0 )
        
        let label = UILabel( frame: labelView.frame )
        label.frame.origin.x = 35.0
        label.text = text
        label.font = UIFont( name: "Bellota-Bold", size: 17.0 )
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Left
        
        labelView.addSubview( label )
        self.addSubview( labelView )
        
        let circlePath = UIBezierPath( ovalInRect: CGRectMake( 0, 0, self.frame.width, self.frame.height ) )
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.path = circlePath.CGPath
        backgroundLayer.fillColor = UIColor.whiteColor().CGColor
        
        self.layer.addSublayer( backgroundLayer )
        
        let imageView = UIImageView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        imageView.image = UIImage( named: imageName )
        imageView.layer.cornerRadius = 37.5
        imageView.layer.masksToBounds = true
        
        self.addSubview( imageView )
    }
    
    func toggleButton( openingState: Bool ) {
        if openingState == true {
            self.alpha = 1
            self.frame.origin.y -= 5
        } else {
            self.alpha = 0
            self.frame.origin.y += 5
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
