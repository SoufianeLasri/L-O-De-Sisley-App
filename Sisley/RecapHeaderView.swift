//
//  RecapHeaderView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 06/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class RecapHeaderView: UIView {
    init( frame: CGRect, text: String ) {
        super.init( frame: frame )
        
        self.roundCorners( [ .TopLeft, .TopRight ], radius: 8.0 )
        
        self.backgroundColor = UIColor( red: 0.44, green: 0.47, blue: 0.67, alpha: 1.0 )
        
        let title = UILabel( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        title.text = text
        title.font = UIFont( name: "Bellota-Regular", size: 16.0 )
        title.textAlignment = .Center
        title.textColor = UIColor.whiteColor()
        
        self.addSubview( title )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
