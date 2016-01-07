//
//  SliderTips.swift
//  Sisley
//
//  Created by Soufiane Lasri on 06/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

// MARK: Circular Slider
class SliderTips: UIControl {
    
    var radius: CGFloat = 0
    var angle: Int = 0
    var border: UIView!
    var dragging: Bool = false
    var handleLayer: UIView!
    var dots: [ SliderTipsDotsView ] = []
    
    // Default initializer
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.opaque = true
        self.center = CGPointMake( super.frame.width / 2, super.frame.height / 2 )
        
        //Define the circle radius taking into account the safe area
        self.radius = self.frame.width / 2 - Config.sliderPadding
        
        // Set the border
        self.border = AngleGradientBorderView(frame: CGRectMake( Config.sliderPadding - 2, Config.sliderPadding - 2, radius * 2 + 4, radius * 2 + 4 ), borderColors: [ UIColor( red: 0.78, green: 0.82, blue: 0.85, alpha: 1 ).CGColor, UIColor.clearColor().CGColor ], borderWidth: 2.0 )
        self.border.transform = CGAffineTransformMakeRotation( CGFloat( DegreesToRadians( -9 ) ) )
        self.addSubview( self.border )
        
        // Draw the golden circle
        let goldenCirclePath = UIBezierPath( ovalInRect: CGRectMake( 2, 2, 40.0, 40.0 ) )
        let goldenCircle = CAShapeLayer()
        goldenCircle.path = goldenCirclePath.CGPath
        goldenCircle.lineWidth = 2
        goldenCircle.strokeColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 ).CGColor
        goldenCircle.fillColor = UIColor( red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0 ).CGColor
        
        self.handleLayer = UIView( frame: CGRectMake( 0, 0, self.frame.width - Config.sliderPadding, self.frame.height - Config.sliderPadding ) )
        goldenCircle.frame = CGRectMake( self.handleLayer.frame.width - 34, self.handleLayer.frame.height / 2 - 22, 44.0, 44.0 )
        self.handleLayer.layer.addSublayer( goldenCircle )
        self.handleLayer.center = self.center
        self.addSubview( self.handleLayer )
        
        let firstDot = SliderTipsDotsView( frame: CGRect( x: 0, y: 0, width: 20, height: 20 ) )
        firstDot.center = self.pointFromAngle( 0 )
        firstDot.toggleDot( true )
        self.dots.append( firstDot )
        
        let secondDot = SliderTipsDotsView( frame: CGRect( x: 0, y: 0, width: 20, height: 20 ) )
        secondDot.center = self.pointFromAngle( 120 )
        self.dots.append( secondDot )
        
        let thirdDot = SliderTipsDotsView( frame: CGRect( x: 0, y: 0, width: 20, height: 20 ) )
        thirdDot.center = self.pointFromAngle( 240 )
        self.dots.append( thirdDot )
        
        for item in self.dots {
            self.addSubview( item )
        }
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
        
        self.slideToNearestDot( self.angle )
    }
    
    // Move the Handle
    func moveHandle( lastPoint: CGPoint ) {
        // Calculate the direction from a center point and a arbitrary position.
        let currentAngle: Double = AngleFromNorth( self.center, p2: lastPoint, flipped: false )
        let angleInt = Int( floor( currentAngle ) )
        
        // Store the new angle
        self.angle = Int( 360 - angleInt )
        
        let borderRotation = DegreesToRadians( Double( -self.angle - 9 ) )
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
    
    func slideToNearestDot( angle: Int ) {
        var nearestDot = 0
        var dotIndex = 0
        
        switch angle {
            case 0...60:
                nearestDot = 0
                dotIndex = 0
            case 61...180:
                nearestDot = 120
                dotIndex = 1
            case 181...300:
                nearestDot = 240
                dotIndex = 2
            case 301...360:
                nearestDot = 0
                dotIndex = 0
            default:
                nearestDot = 0
                dotIndex = 0
        }
        
        UIView.animateWithDuration( 0.5, animations: {
            self.handleLayer.transform = CGAffineTransformMakeRotation( CGFloat( DegreesToRadians( Double( -nearestDot ) ) ) )
            self.border.transform = CGAffineTransformMakeRotation( CGFloat( DegreesToRadians( Double( -nearestDot - 9 ) ) ) )
            
            for (index, item ) in self.dots.enumerate() {
                if index == dotIndex {
                    item.toggleDot( true )
                } else {
                    item.toggleDot( false )
                }
            }
            }, completion: { finished in
                self.angle = nearestDot
                self.sendActionsForControlEvents( UIControlEvents.ValueChanged )
        } )
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