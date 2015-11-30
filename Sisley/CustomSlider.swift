//
//  CustomSlider.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

struct Config {
    static let TB_SLIDER_SIZE: CGFloat = UIScreen.mainScreen().bounds.size.width
    static let TB_SAFEAREA_PADDING: CGFloat = 22.0
    static let TB_LINE_WIDTH: CGFloat = 2.0
    static let TB_FONTSIZE: CGFloat = 40.0
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
    var angle: Int = 90
//    var startColor = UIColor.blueColor()
//    var endColor = UIColor.purpleColor()
    
    // Custom initializer
//    convenience init(startColor:UIColor, endColor:UIColor, frame:CGRect){
//        self.init(frame: frame)
//        
//        self.startColor = startColor
//        self.endColor = endColor
//    }
    
    // Default initializer
    override init( frame: CGRect ) {
        super.init( frame: frame )

        self.backgroundColor = UIColor.clearColor()
        self.opaque = true
        self.center = CGPointMake( self.frame.width / 2 , self.frame.height / 2 )
        
        //Define the circle radius taking into account the safe area
        radius = self.frame.width / 2 - Config.TB_SAFEAREA_PADDING
        
        print( "ViewDidLoad", self.frame )
        
        //Define the Font
//        let font = UIFont( name: "Avenir", size: Config.TB_FONTSIZE )
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
    
    override func beginTrackingWithTouch( touch: UITouch, withEvent event: UIEvent? ) -> Bool {
        super.beginTrackingWithTouch( touch, withEvent: event )
        
        return true
    }
    
    override func continueTrackingWithTouch( touch: UITouch, withEvent event: UIEvent? ) -> Bool {
        super.continueTrackingWithTouch( touch, withEvent: event )
        
        let lastPoint = touch.locationInView( self )
        
        self.moveHandle( lastPoint )
        
        self.sendActionsForControlEvents( UIControlEvents.ValueChanged )
        
        return true
    }
    
    override func endTrackingWithTouch( touch: UITouch?, withEvent event: UIEvent? ) {
        super.endTrackingWithTouch( touch, withEvent: event )
    }
    
    //Use the draw rect to draw the Background, the Circle and the Handle
    override func drawRect( rect: CGRect ) {
        super.drawRect( rect )
        
        let context = UIGraphicsGetCurrentContext()
        
        /** Draw the Background **/
        UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0 ).set()
        CGContextFillEllipseInRect( context, CGRectMake( Config.TB_SAFEAREA_PADDING, Config.TB_SAFEAREA_PADDING, radius * 2, radius * 2 ) )
        
//        let bezierRectangle = UIBezierPath( roundedRect: rect, cornerRadius: rect.width / 2 )
//        let rectangle = CAShapeLayer()
//        rectangle.path = bezierRectangle.CGPath
//        self.layer.addSublayer( rectangle )
        
        let gradientCircle = CAShapeLayer()
//        gradientCircle.path = UI
        
        UIColor( red: 0.78, green: 0.82, blue: 0.86, alpha: 1 ).set()
        CGContextAddArc( context, CGFloat( self.frame.size.width / 2.0 ), CGFloat( self.frame.size.height / 2.0 ), radius, 0, CGFloat( M_PI * 2 ), 0 )

        CGContextSaveGState( context )
        CGContextReplacePathWithStrokedPath( context )
//        let path: CGPathRef = CGContextCopyPath(context)!

        let bbox: CGRect = CGContextGetPathBoundingBox( context )
        let start: CGPoint = bbox.origin
        let end: CGPoint = CGPointMake( CGRectGetMaxX( bbox ), CGRectGetMaxY( bbox ) )
        
        let rgb: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
        let gradient: CGGradientRef = CGGradientCreateWithColors( rgb, [ UIColor( red: 0.78, green: 0.82, blue: 0.86, alpha: 1 ).CGColor, UIColor.clearColor().CGColor ], [ 0.0, 0.8 ] )!

        CGContextClip( context )
        CGContextDrawLinearGradient( context, gradient, start, end, CGGradientDrawingOptions.DrawsBeforeStartLocation )

        CGContextRestoreGState( context )

        CGContextSetLineWidth( context, Config.TB_LINE_WIDTH )
        CGContextSetLineCap( context, .Butt )

        CGContextDrawPath( context, .Stroke )
        
//        /** Draw the circle **/
//        
//        /** Create THE MASK Image **/
//        UIGraphicsBeginImageContext(CGSizeMake(self.bounds.size.width,self.bounds.size.height))
//        let imagecontext = UIGraphicsGetCurrentContext()
//        CGContextAddArc(imagecontext, CGFloat(self.frame.size.width/2)  , CGFloat(self.frame.size.height/2), radius, 0, CGFloat(DegreesToRadians(Double(angle))) , 0)
//        UIColor.redColor().set()
//        
//        //Use shadow to create the Blur effect
//        CGContextSetShadowWithColor(imagecontext, CGSizeMake(0, 0), CGFloat(self.angle/15), UIColor.blackColor().CGColor)
//        
//        //define the path
//        CGContextSetLineWidth(imagecontext, 0)
//        CGContextDrawPath(imagecontext, .Stroke)
//        
//        //save the context content into the image mask
//        let mask:CGImageRef = CGBitmapContextCreateImage(UIGraphicsGetCurrentContext())!
//        UIGraphicsEndImageContext()
//        
//        /** Clip Context to the mask **/
//        CGContextSaveGState(context)
//        
//        CGContextClipToMask(context, self.bounds, mask)
//        
//        
//        /** The Gradient **/
//         
//         // Split colors in components (rgba)
//        let startColorComps:UnsafePointer<CGFloat> = CGColorGetComponents(startColor.CGColor)
//        let endColorComps:UnsafePointer<CGFloat> = CGColorGetComponents(endColor.CGColor)
//        
//        let components : [CGFloat] = [
//            startColorComps[0], startColorComps[1], startColorComps[2], 1.0,     // Start color
//            endColorComps[0], endColorComps[1], endColorComps[2], 1.0      // End color
//        ]
//        
//        // Setup the gradient
//        let baseSpace = CGColorSpaceCreateDeviceRGB()
//        let gradient = CGGradientCreateWithColorComponents(baseSpace, components, nil, 2)
//        
//        // Gradient direction
//        let startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect))
//        let endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect))
//        
//        // Draw the gradient
//        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, .DrawsBeforeStartLocation)
//        CGContextRestoreGState(context)
        
        /* Draw the handle */
        drawTheHandle( context! )
    }
    
    
    /** Draw a white knob over the circle **/
    
    func drawTheHandle( context: CGContextRef ) {
        //Get the handle position
        let handleCenter = pointFromAngle( angle )
        
        CGContextSaveGState( context )
        
        //I Love shadows
//        CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 3, UIColor.blackColor().CGColor)
        
        //Draw It!
//        UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1 ).set()
//        CGContextFillEllipseInRect(context, CGRectMake(handleCenter.x, handleCenter.y, Config.TB_LINE_WIDTH, Config.TB_LINE_WIDTH))

        CGContextAddArc( context, handleCenter.x, handleCenter.y, 22.0, 0, CGFloat( M_PI * 2 ), 0 )
        UIColor( red: 1.0, green: 1.0, blue: 1.0, alpha: 1 ).set()
        
        CGContextSetLineWidth( context, 4 )
        CGContextSetLineCap( context, .Butt )
        
        CGContextDrawPath( context, .Stroke )
        
        CGContextAddArc( context, handleCenter.x, handleCenter.y, 20.0, 0, CGFloat( M_PI * 2 ), 0 )
        UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1 ).set()
        
        CGContextSetLineWidth( context, 2 )
        CGContextSetLineCap( context, .Butt )
        
        CGContextDrawPath( context, .Stroke )
        
        CGContextRestoreGState( context )
    }
    
    /** Move the Handle **/
    func moveHandle( lastPoint: CGPoint ) {
        
        //Get the center
        let centerPoint: CGPoint = CGPointMake( self.frame.width / 2, self.frame.height / 2 )
        //Calculate the direction from a center point and a arbitrary position.
        let currentAngle: Double = AngleFromNorth( centerPoint, p2: lastPoint, flipped: false )
        let angleInt = Int( floor( currentAngle ) )
        
        //Store the new angle
        angle = Int( 360 - angleInt )
        
        //Update the textfield
//        textField!.text = "\(angle)"
        
        //Redraw
        setNeedsDisplay()
        layoutIfNeeded()
    }
    
    /** Given the angle, get the point position on circumference **/
    func pointFromAngle( angleInt: Int ) -> CGPoint {
        
        //Circle center
        let centerPoint = CGPointMake( self.frame.size.width / 2.0 - Config.TB_LINE_WIDTH / 2.0, self.frame.size.height / 2.0 - Config.TB_LINE_WIDTH / 2.0 )
        
        //The point position on the circumference
        var result: CGPoint = CGPointZero
        let y = round( Double( radius ) * sin( DegreesToRadians( Double( -angleInt ) ) ) ) + Double( centerPoint.y )
        let x = round( Double( radius ) * cos( DegreesToRadians( Double( -angleInt ) ) ) ) + Double( centerPoint.x )
        result.y = CGFloat( y )
        result.x = CGFloat( x )
        
        return result
    }
    
    
    //Sourcecode from Apple example clockControl
    //Calculate the direction in degrees from a center point to an arbitrary position.
    func AngleFromNorth( p1: CGPoint , p2: CGPoint , flipped: Bool ) -> Double {
        var v: CGPoint  = CGPointMake( p2.x - p1.x, p2.y - p1.y )
        let vmag: CGFloat = Square( Square( v.x ) + Square( v.y ) )
        var result: Double = 0.0
        v.x /= vmag
        v.y /= vmag
        let radians = Double( atan2( v.y, v.x ) )
        result = RadiansToDegrees( radians )
        return ( result >= 0  ? result : result + 360.0 )
    }
    
    required init( coder aDecoder: NSCoder ) {
        fatalError( "init(coder:) has not been implemented" )
    }
}