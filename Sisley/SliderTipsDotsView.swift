//
//  SliderTipsDotsView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 06/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class SliderTipsDotsView: UIView {
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor( red: 0.5, green: 0.54, blue: 0.68, alpha: 1.0 )
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 2.0
    }
    
    func toggleDot( state: Bool ) {
        if state == true {
            self.backgroundColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        } else {
            self.backgroundColor = UIColor( red: 0.5, green: 0.54, blue: 0.68, alpha: 1.0 )
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
