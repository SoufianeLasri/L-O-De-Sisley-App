//
//  CustomSliderView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CustomSliderView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Build the slider
        let slider: CustomSlider = CustomSlider( frame: self.frame )
        
        // Attach an Action and a Target to the slider
        slider.addTarget( self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged )
        
        // Add the slider as subview of this view
        self.addSubview( slider )
    }
    
    func valueChanged( slider: CustomSlider ) {
        // Do something with the value...
        print( "Value changed \( slider.angle )" )
    }
}
