//
//  DetailsView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 29/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class DetailsView: UIView {
    init( frame: CGRect, data: [ String : String ] ) {
        super.init( frame: frame )
        
        let cureTitle = UILabel( frame: CGRect( x: 20, y: 10, width: self.frame.width, height: 40 ) )
        cureTitle.text = "Le soin"
        cureTitle.font = UIFont( name: "Bellota-Bold", size: 20.0 )
        cureTitle.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        self.addSubview( cureTitle )
        
        let cureDetails = UILabel( frame: CGRect( x: 20, y: 30, width: self.frame.width, height: 80 ) )
        cureDetails.text = data[ "details" ]
        cureDetails.numberOfLines = 2
        cureDetails.font = UIFont( name: "Bellota-Regular", size: 17.0 )
        cureDetails.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        self.addSubview( cureDetails )

        let knowMore = UILabel( frame: CGRect( x: 20, y: 65, width: self.frame.width, height: 80 ) )
        knowMore.text = "En savoir plus"
        knowMore.numberOfLines = 2
        knowMore.font = UIFont( name: "Bellota-Bold", size: 17.0 )
        knowMore.textColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        let underlineAttribute = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue ]
        let underlineAttributedString = NSAttributedString( string: knowMore.text!, attributes: underlineAttribute )
        knowMore.attributedText = underlineAttributedString
        self.addSubview( knowMore )
        
        let tipTitle = UILabel( frame: CGRect( x: 20, y: 140, width: self.frame.width, height: 40 ) )
        tipTitle.text = "Le conseil Sisley"
        tipTitle.font = UIFont( name: "Bellota-Bold", size: 20.0 )
        tipTitle.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        self.addSubview( tipTitle )
        
        let tipDetails = UILabel( frame: CGRect( x: 20, y: 160, width: self.frame.width, height: 200 ) )
        tipDetails.text = data[ "tip" ]
        tipDetails.numberOfLines = 6
        tipDetails.font = UIFont( name: "Bellota-Regular", size: 17.0 )
        tipDetails.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        self.addSubview( tipDetails )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
