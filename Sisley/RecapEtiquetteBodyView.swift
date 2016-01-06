//
//  RecapEtiquetteBodyView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 06/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class RecapEtiquetteBodyView: UIView {
    init( frame: CGRect, text: String ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        label.text = text
        label.font = UIFont( name: "Bellota-Italic", size: 18.0 )
        label.textAlignment = .Center
        label.textColor = UIColor(red:0.89, green:0.81, blue:0.47, alpha:1)
        self.addSubview( label )
        
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint( CGPoint( x: 0, y: 0 ) )
        trianglePath.addLineToPoint( CGPoint( x: 30, y: 0 ) )
        trianglePath.addLineToPoint( CGPoint( x: 15, y: 15 ) )
        
        let triangleShape         = CAShapeLayer()
        triangleShape.path        = trianglePath.CGPath
        triangleShape.lineCap     = kCALineJoinRound
        triangleShape.fillColor   = UIColor.whiteColor().CGColor
        triangleShape.frame.origin = CGPoint( x: self.frame.width / 2 - 15, y: self.frame.height )
        self.layer.addSublayer( triangleShape )
        
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake( 0, 2 )
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
