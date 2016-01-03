//
//  HeaderView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 26/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    init( frame: CGRect, data: [ String : String ] ) {
        super.init( frame: frame )
        
        self.roundCorners( [ .TopLeft, .TopRight ], radius: 12.0 )
        
        self.backgroundColor = UIColor( red: 0.44, green: 0.47, blue: 0.67, alpha: 1.0 )
        
        let title = UILabel( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        title.text = data[ "title" ]
        title.font = UIFont( name: "Bellota-Regular", size: 17.0 )
        title.textAlignment = .Center
        title.textColor = UIColor.whiteColor()
        
        self.addSubview( title )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
