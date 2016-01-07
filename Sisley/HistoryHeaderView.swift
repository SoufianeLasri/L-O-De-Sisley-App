//
//  HistoryHeaderView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 07/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class HistoryHeaderView: UIView {
    
    var title: UILabel!
    
    init( frame: CGRect, data: String ) {
        super.init( frame: frame )
        
        self.roundCorners( [ .TopLeft, .TopRight ], radius: 12.0 )
        
        self.backgroundColor = UIColor( red: 0.44, green: 0.47, blue: 0.67, alpha: 1.0 )
        
        self.title = UILabel( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        self.title.text = data
        self.title.font = UIFont( name: "Bellota-Regular", size: 16.0 )
        self.title.textAlignment = .Center
        self.title.textColor = UIColor.whiteColor()
        
        self.addSubview( self.title )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
