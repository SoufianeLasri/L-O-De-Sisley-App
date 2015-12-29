//
//  CarouselController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 28/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CustomCarouselController: UIScrollView, UIScrollViewDelegate {
    
    var views: [ UIView ]!
    var dots: [ DotView ] = []
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        self.backgroundColor = UIColor.whiteColor()
        self.bounces = false
        self.pagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.delegate = self
        
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
        
        for i in 0..<4 {
            let xPosition = self.frame.width / 2 + CGFloat( 15 * ( i - 2 ) ) + 35
            let dot = DotView( frame: CGRect( x: xPosition, y: self.frame.height - 50, width: 7, height: 7 ) )
            self.dots.append( dot )
        }
        
        self.contentSize = CGSize( width: self.frame.width * CGFloat( self.views.count ), height: self.frame.height )
        
        scrollViewDidScroll( self )
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let indexOfPage: Int = Int( ( self.contentOffset.x + self.frame.width / 2 ) / self.frame.width )
        
        for ( index, item ) in self.dots.enumerate() {
            if indexOfPage == index {
                item.toggleDot( true )
            } else {
                item.toggleDot( false )
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
