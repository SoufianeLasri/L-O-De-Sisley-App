//
//  CarouselController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 28/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CustomCarouselController: UIScrollView {
    
    var views: [ UIView ]!
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        self.backgroundColor = UIColor.whiteColor()
        self.bounces = false
        self.pagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        self.views = [
            PackShotView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) ),
            DetailsView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) ),
            CommentView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) ),
            ReactionsView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        ]
        
        for ( index, item ) in self.views.enumerate() {
            item.frame.origin.x = self.frame.width * CGFloat( index )
            self.addSubview( item )
        }
        
        self.contentSize = CGSize( width: self.frame.width * CGFloat( self.views.count ), height: self.frame.height )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
