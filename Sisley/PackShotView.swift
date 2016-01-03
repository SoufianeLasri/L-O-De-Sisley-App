//
//  PackShotView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 29/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class PackShotView: UIView {
    init( frame: CGRect, data: [ String : String ] ) {
        super.init( frame: frame )
        
        let imageView = UIImageView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.width ) )
        imageView.contentMode = .ScaleAspectFit
        imageView.image = UIImage( named: data[ "image" ]! )
        self.addSubview( imageView )
        
        let timeTitle = UILabel( frame: CGRect( x: 0, y: 10, width: self.frame.width, height: 40 ) )
        timeTitle.textAlignment = .Center
        timeTitle.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        let experienceString = NSMutableAttributedString( string: "Durée de l'expérience : ", attributes: [ NSFontAttributeName: UIFont( name: "Bellota-Bold", size: 14.0 )! ] )
        let timeString = NSMutableAttributedString( string: data[ "time" ]!, attributes: [ NSFontAttributeName: UIFont( name: "Bellota-Regular", size: 14.0 )! ] )
        experienceString.appendAttributedString( timeString )
        timeTitle.attributedText = experienceString
        self.addSubview( timeTitle )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}