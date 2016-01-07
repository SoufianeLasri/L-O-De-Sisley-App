//
//  SliderTipsView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 06/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

protocol SliderTipsViewDelegate: class {
    func getValue( value: Double )
}

class SliderTipsView: UIView {
    
    var slider: SliderTips!
    var delegate: SliderTipsViewDelegate?
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.slider = SliderTips( frame: self.frame )
        self.slider.addTarget( self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged )
        self.slider.transform = CGAffineTransformMakeRotation( CGFloat( -M_PI / 180.0 * Double( 90.0 ) ) )
        self.addSubview( slider )
    }
    
    func roundToPlaces( number: Double, places: Int ) -> Double {
        let divisor = pow( 10.0, Double( places ) )
        return round( number * divisor ) / divisor
    }
    
    func valueChanged( slider: CustomSlider ) {
        var result: Double = Double( slider.angle ) / 360
        result = roundToPlaces( Double( result ), places: 2 )
        
        self.delegate?.getValue( result )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
