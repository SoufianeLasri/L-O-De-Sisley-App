//
//  NextButton.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class NextButton: UIButton {
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.layer.cornerRadius = self.frame.width / 2
        
        let imageView = UIImageView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        imageView.image = UIImage( named: "goBack.png" )
        imageView.layer.cornerRadius = self.frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.transform = CGAffineTransformMakeRotation( CGFloat( M_PI ) )
        self.addSubview( imageView )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}