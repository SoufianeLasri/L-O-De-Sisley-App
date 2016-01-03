//
//  CustomSlider.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

struct Config {
    static let slideSize: CGFloat = UIScreen.mainScreen().bounds.size.width
    static let sliderPadding: CGFloat = 22.0
    static let sliderLineWidth: CGFloat = 2.0
    static let sliderFontSize: CGFloat = 40.0
}

// MARK: Math Helpers
func DegreesToRadians( value: Double ) -> Double {
    return value * M_PI / 180.0
}

func RadiansToDegrees( value: Double ) -> Double {
    return value * 180.0 / M_PI
}

func Square( value: CGFloat ) -> CGFloat {
    return value * value
}

// MARK: Circular Slider
class CustomSlider: UIControl {

    var radius: CGFloat = 0
    var angle: Int = 0
    var border: UIView = UIView()
    var min: Double = 37.0
    var max: Double = 227.0
    var dragging: Bool = false
    var handleLayer: UIView = UIView()
    var validateFeedback: CAShapeLayer = CAShapeLayer()
    var fillColorAnimation: CAKeyframeAnimation = CAKeyframeAnimation()
    var radiusAnimation: CAKeyframeAnimation = CAKeyframeAnimation()
    
    // Default initializer
    override init( frame: CGRect ) {
        super.init( frame: frame )

        self.backgroundColor = UIColor.clearColor()
        self.opaque = true
        self.center = CGPointMake( super.frame.width / 2, super.frame.height / 2 )
        
        //Define the circle radius taking into account the safe area
        self.radius = self.frame.width / 2 - Config.sliderPadding
        
        // Set the border
        self.border = AngleGradientBorderView(frame: CGRectMake( Config.sliderPadding - 2, Config.sliderPadding - 2, radius * 2 + 4, radius * 2 + 4 ), borderColors: [ UIColor( red: 0.78, green: 0.82, blue: 0.85, alpha: 1 ).CGColor, UIColor.clearColor().CGColor ], borderWidth: 2.0 )
        self.border.transform = CGAffineTransformMakeRotation( CGFloat( DegreesToRadians( -9 ) ) )
        self.addSubview( self.border )
        
        // Draw the background
        let backgroundPath = UIBezierPath( ovalInRect: CGRectMake( Config.sliderPadding + 1, Config.sliderPadding + 1, self.radius * 2 - 2, self.radius * 2 - 2 ) )
        let background = CAShapeLayer()
        background.path = backgroundPath.CGPath
        background.fillColor = UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0 ).CGColor
        self.layer.insertSublayer( background, below: self.border.layer )
        
        // Draw the golden circle
        let goldenCirclePath = UIBezierPath( ovalInRect: CGRectMake( 2, 2, 40.0, 40.0 ) )
        let goldenCircle = CAShapeLayer()
        goldenCircle.path = goldenCirclePath.CGPath
        goldenCircle.lineWidth = 2
        goldenCircle.strokeColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 ).CGColor
        goldenCircle.fillColor = UIColor( red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0 ).CGColor
        
        self.handleLayer.frame = CGRectMake( 0, 0, self.frame.width - Config.sliderPadding, self.frame.height - Config.sliderPadding )
        goldenCircle.frame = CGRectMake( self.handleLayer.frame.width - 34, self.handleLayer.frame.height / 2 - 22, 44.0, 44.0 )
        self.handleLayer.layer.addSublayer( goldenCircle )
        self.handleLayer.center = self.center
        self.addSubview( self.handleLayer )
        
        // The validate button
        let validateButton = UIButton( frame: CGRectMake( 0, 0, self.frame.width / 2, self.frame.height / 2 ) )
        validateButton.center = self.center
        validateButton.layer.cornerRadius = validateButton.frame.width / 2
        validateButton.addTarget( self, action: Selector( "validateValue:" ), forControlEvents: .TouchUpInside )
        self.addSubview( validateButton )
        
        // The visual feedback when tapping the validate button
        let validateFeedbackPath = UIBezierPath( ovalInRect: CGRectMake( Config.sliderPadding, Config.sliderPadding, self.radius * 2, self.radius * 2 ) )
        self.validateFeedback = CAShapeLayer()
        self.validateFeedback.path = validateFeedbackPath.CGPath
        self.validateFeedback.fillColor = UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 0.0 ).CGColor
        self.validateFeedback.frame = self.border.frame
        self.layer.insertSublayer( self.validateFeedback, below: background )
        
        // Build animations
        self.fillColorAnimation          = CAKeyframeAnimation( keyPath: "fillColor" )
        self.fillColorAnimation.duration = 0.5
        self.fillColorAnimation.keyTimes = [ 0.0, 0.5, 1.0 ]
        self.fillColorAnimation.values   = [
            UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 0.0 ).CGColor,
            UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0 ).CGColor,
            UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 0.0 ).CGColor
        ]
        
        self.radiusAnimation          = CAKeyframeAnimation( keyPath: "transform.scale" )
        self.radiusAnimation.duration = 0.5
        self.radiusAnimation.keyTimes = [ 0.0, 1.0 ]
        self.radiusAnimation.values   = [ 1.0, 1.4 ]
    }
    
    func validateValue( sender: UIButton! ) {
        if !self.dragging {
            self.validateFeedback.addAnimation( self.fillColorAnimation, forKey: "fillColor" )
            self.validateFeedback.addAnimation( self.radiusAnimation, forKey: "transform.scale" )
            
            self.sendActionsForControlEvents( UIControlEvents.TouchUpInside )
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
    
    func resetSlider() {
        
        UIView.animateWithDuration( 0.5, animations: {
            self.handleLayer.transform = CGAffineTransformMakeRotation( CGFloat( DegreesToRadians( 0 ) ) )
            self.border.transform = CGAffineTransformMakeRotation( CGFloat( DegreesToRadians( -9 ) ) )
        }, completion: { finished in
            self.angle = 0
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