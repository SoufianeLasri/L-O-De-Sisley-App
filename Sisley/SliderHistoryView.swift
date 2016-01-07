//
//  SliderHistoryView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 07/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

protocol SliderHistoryViewDelegate: class {
    func getValue( value: Int )
}

class SliderHistoryView: UIView {
    
    var slider: SliderHistory!
    var delegate: SliderHistoryViewDelegate?
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.slider = SliderHistory( frame: self.frame )
        self.slider.addTarget( self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged )
        self.slider.transform = CGAffineTransformMakeRotation( CGFloat( -M_PI / 180.0 * Double( 90.0 ) ) )
        self.addSubview( slider )
    }
    
    func roundToPlaces( number: Double, places: Int ) -> Double {
        let divisor = pow( 10.0, Double( places ) )
        return round( number * divisor ) / divisor
    }
    
    func valueChanged( slider: CustomSlider ) {
        var result: Double = Double( slider.angle )
        result = roundToPlaces( Double( result ), places: 2 )
        
        self.delegate?.getValue( slider.angle )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
