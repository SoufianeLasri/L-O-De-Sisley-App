//
//  DotView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 29/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class DotView: UIView {
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor( red: 0.5, green: 0.55, blue: 0.68, alpha: 1.0 ).CGColor
    }
    
    func toggleDot( state: Bool ) {
        if state == true {
            UIView.animateWithDuration( 0.3, animations: {
                self.backgroundColor = UIColor( red: 0.5, green: 0.55, blue: 0.68, alpha: 1.0 )
            }, completion: nil )
        } else {
            UIView.animateWithDuration( 0.3, animations: {
                self.backgroundColor = UIColor.whiteColor()
            }, completion: nil )
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
