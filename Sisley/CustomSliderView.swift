//
//  CustomSliderView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

protocol CustomSliderViewDelegate: class {
    func getValue( value: Double )
    func validateQuestion()
}

class CustomSliderView: UIView {
    
    var min: Double = 12.0
    var max: Double = 99.0
    var slider: CustomSlider! = nil
    var delegate: CustomSliderViewDelegate?

    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        // Build the slider
        self.slider = CustomSlider( frame: self.frame )

        // Attach an Action and a Target to the slider
        self.slider.addTarget( self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged )
        self.slider.addTarget( self, action: "validateValue:", forControlEvents: UIControlEvents.TouchUpInside )
        self.slider.transform = CGAffineTransformMakeRotation( CGFloat( -M_PI / 180.0 * Double( 90.0 ) ) )
        
        // Add the slider as subview of this view
        self.addSubview( slider )
    }
    
    func roundToPlaces( number: Double, places:Int ) -> Double {
        let divisor = pow( 10.0, Double( places ) )
        return round( number * divisor) / divisor
    }
    
    func valueChanged( slider: CustomSlider ) {
        // Do something with the value...
        
        var result: Double = Double( slider.angle ) / 360
        result = roundToPlaces( Double( result ), places: 2 ) * ( self.max - self.min ) + self.min
        
        self.delegate?.getValue( result )
    }
    
    func validateValue( sender: UIButton! ) {
        self.delegate?.validateQuestion()
        self.slider.resetSlider()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
