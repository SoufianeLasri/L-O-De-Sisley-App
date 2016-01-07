//
//  SliderHistory.swift
//  Sisley
//
//  Created by Soufiane Lasri on 07/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class SliderHistory: UIControl {
    
    var radius: CGFloat = 0
    var angle: Int = 0
    var border: UIImageView!
    var dragging: Bool = false
    var handleLayer: UIView!
    
    // Default initializer
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.opaque = true
        self.center = CGPointMake( super.frame.width / 2, super.frame.height / 2 )
        
        //Define the circle radius taking into account the safe area
        self.radius = self.frame.width / 2 - Config.sliderPadding
        
        // Set the border
        self.border = UIImageView( frame: CGRect( x: Config.sliderPadding - 2, y: Config.sliderPadding - 2, width: self.radius * 2 + 4, height: self.radius * 2 + 4 ) )
        self.border.image = UIImage( named: "dial.png" )
        self.border.transform = CGAffineTransformMakeRotation( CGFloat( DegreesToRadians( 90 ) ) )
        self.addSubview( self.border )
        
        // Draw the golden circle
        let goldenCirclePath = UIBezierPath( ovalInRect: CGRect( x: 2, y: 2, width: 40.0, height: 40.0 ) )
        let goldenCircle = CAShapeLayer()
        goldenCircle.path = goldenCirclePath.CGPath
        goldenCircle.lineWidth = 2
        goldenCircle.strokeColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 ).CGColor
        goldenCircle.fillColor = UIColor( red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0 ).CGColor
        
        self.handleLayer = UIView( frame: CGRect( x: 0, y: 0, width: self.frame.width - Config.sliderPadding, height: self.frame.height - Config.sliderPadding ) )
        goldenCircle.frame = CGRectMake( self.handleLayer.frame.width - 34, self.handleLayer.frame.height / 2 - 22, 44.0, 44.0 )
        self.handleLayer.layer.addSublayer( goldenCircle )
        self.handleLayer.center = self.center
        self.addSubview( self.handleLayer )
    }
    
    override func touchesBegan( touches: Set<UITouch>, withEvent event: UIEvent? ) {
        if let touch: UITouch? = touches.first {
            let lastPoint = touch!.locationInView( self.handleLayer )
            if ( CGRectContainsPoint( self.handleLayer.layer.sublayers![ 0 ].frame, lastPoint ) ) {
                self.dragging = true
            }
        }
    }
    
    override func touchesMoved( touches: Set<UITouch>, withEvent event: UIEvent? ) {
        if self.dragging {
            let lastPoint = touches.first!.locationInView( self )
            moveHandle( lastPoint )
            self.sendActionsForControlEvents( UIControlEvents.ValueChanged )
        }
    }
    
    override func touchesEnded( touches: Set<UITouch>, withEvent event: UIEvent? ) {
        self.dragging = false
    }
    
    // Move the Handle
    func moveHandle( lastPoint: CGPoint ) {
        // Calculate the direction from a center point and a arbitrary position.
        let currentAngle: Double = AngleFromNorth( self.center, p2: lastPoint, flipped: false )
        let angleInt = Int( floor( currentAngle ) )
        
        // Store the new angle
        self.angle = Int( 360 - angleInt )
        
        let borderRotation = DegreesToRadians( Double( -self.angle + 90 ) )
        self.border.transform = CGAffineTransformMakeRotation( CGFloat( borderRotation )  )
        
        self.handleLayer.layer.sublayers![ 0 ].needsDisplay()
        let handleRotation = DegreesToRadians( Double( -self.angle ) )
        self.handleLayer.transform = CGAffineTransformMakeRotation( CGFloat( handleRotation )  )
    }
    
    // Given the angle, get the point position on circumference
    func pointFromAngle( angleInt: Int ) -> CGPoint {
        // Circle center
        let centerPoint = self.center
        
        // The point position on the circumference
        var result: CGPoint = CGPointZero
        let y = round( Double( radius ) * sin( DegreesToRadians( Double( -angleInt ) ) ) ) + Double( centerPoint.y )
        let x = round( Double( radius ) * cos( DegreesToRadians( Double( -angleInt ) ) ) ) + Double( centerPoint.x )
        result.y = CGFloat( y )
        result.x = CGFloat( x )
        
        return result
    }
    
    // Sourcecode from Apple example clockControl
    // Calculate the direction in degrees from a center point to an arbitrary position.
    func AngleFromNorth( p1: CGPoint , p2: CGPoint , flipped: Bool ) -> Double {
        var v: CGPoint  = CGPointMake( p2.x - p1.x, p2.y - p1.y )
        let vmag: CGFloat = Square( Square( v.x ) + Square( v.y ) )
        var result: Double = 0.0
        v.x /= vmag
        v.y /= vmag
        let radians = Double( atan2( v.y, v.x ) )
        result = RadiansToDegrees( radians )
        return result >= 0 ? result : result + 360
    }
    
    required init( coder aDecoder: NSCoder ) {
        fatalError( "init(coder:) has not been implemented" )
    }
}