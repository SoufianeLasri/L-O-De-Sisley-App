//
//  SharingMenuButton.swift
//  Sisley
//
//  Created by Soufiane Lasri on 25/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class SharingMenuButton: UIButton {
    
    var menuView: SharingView = SharingView()
    
    init( frame: CGRect, menuView: SharingView ) {
        super.init( frame: frame )
        
        self.menuView = menuView
        
        self.backgroundColor    = UIColor.whiteColor()
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth  = 2.0
        self.layer.borderColor  = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 ).CGColor
        
        let imageView = UIImageView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        imageView.image = UIImage( named: "sharingButton.png" )
        imageView.layer.cornerRadius = self.frame.width / 2
        imageView.layer.masksToBounds = true
        self.addSubview( imageView )
        
        let openingTap = UITapGestureRecognizer( target: self, action: "openSharingMenu:" )
        self.addGestureRecognizer( openingTap )
    }
    
    func openSharingMenu( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            self.menuView.openMenu()
        }
    }
    
//    func toggleButton( openingState: Bool ) {
//        if openingState == true {
//            self.alpha = 0.1
//        } else {
//            self.alpha = 1.0
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}