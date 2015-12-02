//
//  CustomSliderView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CustomSliderView: UIView {
    
    var min: Double = 27.0
    var max: Double = 42.0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Build the slider
        let slider: CustomSlider = CustomSlider( frame: self.frame )
        
        // Attach an Action and a Target to the slider
        slider.addTarget( self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged )
        
        // Add the slider as subview of this view
        self.addSubview( slider )
    }
    
    func roundToPlaces(number: Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round( number * divisor) / divisor
    }
    
    func valueChanged( slider: CustomSlider ) {
        // Do something with the value...
        
        var result: Double = Double( slider.angle ) / 360
        result = roundToPlaces( Double( result ), places: 2 ) * ( self.max - self.min ) + self.min
        print( "Value changed \( result )" )
    }
}
