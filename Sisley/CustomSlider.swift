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
    
//    var textField: UITextField?
    var radius: CGFloat = 0
    var angle: Int = 0
    var border: UIView = UIView()
    var min: Double = 37.0
    var max: Double = 227.0
    var dragging: Bool = false
    var handleLayer: UIView = UIView()
    
    // Default initializer
    override init( frame: CGRect ) {
        super.init( frame: frame )

        self.backgroundColor = UIColor.clearColor()
        self.opaque = true
        self.center = CGPointMake( self.frame.width / 2, self.frame.height / 2 )
        
        //Define the circle radius taking into account the safe area
        self.radius = self.frame.width / 2 - Config.sliderPadding
        
        // Set the border
        self.border = AngleGradientBorderView(frame: CGRectMake( Config.sliderPadding - 2, Config.sliderPadding - 2, radius * 2 + 4, radius * 2 + 4 ), borderColors: [ UIColor( red: 0.78, green: 0.82, blue: 0.85, alpha: 1 ).CGColor, UIColor.clearColor().CGColor ], borderWidth: 2.0 )
        self.border.transform = CGAffineTransformMakeRotation( CGFloat( DegreesToRadians( -10 ) ) )
        self.addSubview( self.border )
        
        // Draw the background
        let backgroundPath = UIBezierPath( ovalInRect: CGRectMake( Config.sliderPadding, Config.sliderPadding, radius * 2, radius * 2 ) )
        let background = CAShapeLayer()
        background.path = backgroundPath.CGPath
        background.fillColor = UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0 ).CGColor
        self.layer.insertSublayer( background, below: self.border.layer )
        
        // Draw the white circle
        let whiteCirclePath = UIBezierPath( ovalInRect: CGRectMake( 0, 0, 44.0, 44.0 ) )
        let whiteCircle = CAShapeLayer()
        whiteCircle.path = whiteCirclePath.CGPath
        whiteCircle.lineWidth = 4
        whiteCircle.strokeColor = UIColor( red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0 ).CGColor
        whiteCircle.fillColor = UIColor( red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0 ).CGColor
        
        // Draw the golden circle
        let goldenCirclePath = UIBezierPath( ovalInRect: CGRectMake( 2, 2, 40.0, 40.0 ) )
        let goldenCircle = CAShapeLayer()
        goldenCircle.path = goldenCirclePath.CGPath
        goldenCircle.lineWidth = 2
        goldenCircle.strokeColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 ).CGColor
        goldenCircle.fillColor = UIColor( red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0 ).CGColor
        
        self.handleLayer.layer.addSublayer( whiteCircle )
        self.handleLayer.layer.addSublayer( goldenCircle )
        self.handleLayer.frame = CGRectMake( 0, 0, 44.0, 44.0 )
        
        self.handleLayer.center = pointFromAngle( angle )
        self.addSubview( self.handleLayer )
        
        //Define the Font
//        let font = UIFont( name: "Avenir", size: Config.sliderFontSize )
//        //Calculate font size needed to display 3 numbers
//        let str = "000" as NSString
//        let fontSize: CGSize = str.sizeWithAttributes( [ NSFontAttributeName:font! ] )
//        
//        //Using a TextField area we can easily modify the control to get user input from this field
//        let textFieldRect = CGRectMake(
//            ( frame.size.width  - fontSize.width ) / 2.0,
//            ( frame.size.height - fontSize.height ) / 2.0,
//            fontSize.width, fontSize.height )
//        
//        textField = UITextField( frame: textFieldRect )
//        textField?.backgroundColor = UIColor.clearColor()
//        textField?.textColor = UIColor( white: 1.0, alpha: 0.8 )
//        textField?.textAlignment = .Center
//        textField?.font = font
//        textField?.text = "\(self.angle)"
        
//        addSubview(textField!)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch: UITouch? = touches.first {
            let lastPoint = touch!.locationInView( self )
            if ( CGRectContainsPoint(self.handleLayer.frame, lastPoint ) ) {
                self.dragging = true
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if self.dragging {
            let lastPoint = touches.first!.locationInView( self )
            moveHandle( lastPoint )
            self.sendActionsForControlEvents( UIControlEvents.ValueChanged )
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.dragging = false
    }
    
    // Move the Handle
    func moveHandle( lastPoint: CGPoint ) {
        
        // Get the center
        let centerPoint: CGPoint = CGPointMake( self.frame.width / 2, self.frame.height / 2 )
        
        // Calculate the direction from a center point and a arbitrary position.
        let currentAngle: Double = AngleFromNorth( centerPoint, p2: lastPoint, flipped: false )
        let angleInt = Int( floor( currentAngle ) )
        
        // Store the new angle
        self.angle = Int( 360 - angleInt )
        
        let borderRotation = DegreesToRadians( Double( -self.angle - 10 ) )
        self.border.transform = CGAffineTransformMakeRotation( CGFloat( borderRotation )  )
        
        self.handleLayer.center = pointFromAngle( self.angle )
        
        // Update the textfield
//        textField!.text = "\(angle)"
    }
    
    // Given the angle, get the point position on circumference
    func pointFromAngle( angleInt: Int ) -> CGPoint {
        
        // Circle center
        let centerPoint = CGPointMake( self.frame.size.width / 2.0 - Config.sliderLineWidth / 2.0, self.frame.size.height / 2.0 - Config.sliderLineWidth / 2.0 )
        
        // The point position on the circumference
        var result: CGPoint = CGPointZero
        let y = round( Double( radius ) * sin( DegreesToRadians( Double( -angleInt ) ) ) ) + Double( centerPoint.y )
        let x = round( Double( radius ) * cos( DegreesToRadians( Double( -angleInt ) ) ) ) + Double( centerPoint.x )
        result.y = CGFloat( y )
        result.x = CGFloat( x )
        
        return result
    }
    
    func setRangeOfValue( min: Double, max: Double ) {
        self.min = min
        self.max = max
        
        resetSlider()
    }
    
    func resetSlider() {
        self.angle = 90
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