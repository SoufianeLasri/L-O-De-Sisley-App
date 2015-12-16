//
//  AngleGradientBorderView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 30/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

//
//  AngleGradientBorderView.swift
//  AngleGradientBorderTutorial
//

import UIKit

class AngleGradientBorderView: UIView {
    
    // Constants
    let DefaultGradientBorderColors: [AnyObject] = [
        UIColor( red: 0.78, green: 0.82, blue: 0.85, alpha: 1 ).CGColor,
        UIColor.clearColor().CGColor
    ]
    let DefaultGradientBorderWidth: CGFloat = 2
    
    // Set the UIView's layer class to be our AngleGradientBorderLayer
    override class func layerClass() -> AnyClass {
        return AngleGradientBorderLayer.self
    }
    
    // Initializer
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupGradientLayer()
    }
    
    // Custom initializer
    init( frame: CGRect, borderColors gradientBorderColors: [AnyObject]? = nil, borderWidth gradientBorderWidth: CGFloat? = nil ) {
        super.init( frame: frame )
        self.backgroundColor = UIColor.clearColor()
        setupGradientLayer( borderColors: gradientBorderColors, borderWidth: gradientBorderWidth )
    }
    
    // Setup the attributes of this view's layer
    func setupGradientLayer( borderColors gradientBorderColors: [AnyObject]? = nil, borderWidth gradientBorderWidth: CGFloat? = nil ) {
        // Grab this UIView's layer and cast it as AngleGradientBorderLayer
        let l: AngleGradientBorderLayer = self.layer as! AngleGradientBorderLayer
        
        // NOTE: Since our gradient layer is built as an image,
        // we need to scale it to match the display of the device.
        l.contentsScale = UIScreen.mainScreen().scale
        
        // Set the gradient colors
        if gradientBorderColors != nil {
            l.colors = gradientBorderColors!
        } else {
            l.colors = DefaultGradientBorderColors
        }
        
        // Set the border width of the gradient
        if gradientBorderWidth != nil {
            l.gradientBorderWidth = gradientBorderWidth!
        } else {
            l.gradientBorderWidth = DefaultGradientBorderWidth
        }
    }
    
}