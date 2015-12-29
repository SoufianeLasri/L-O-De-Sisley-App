//
//  CarouselController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 28/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CustomCarouselController: UIScrollView {
    override init( frame: CGRect ) {
        super.init( frame: frame )
        self.backgroundColor = UIColor.whiteColor()
        self.bounces = false
        self.pagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        let packShotView = PackShotView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        self.addSubview( packShotView )
        
        let detailsView = DetailsView( frame: CGRect( x: self.frame.width, y: 0, width: self.frame.width, height: self.frame.height ) )
        self.addSubview( detailsView )
        
        let thirdView = UIView( frame: CGRect( x: self.frame.width * 2, y: 0, width: self.frame.width, height: self.frame.height ) )
        thirdView.backgroundColor = UIColor.yellowColor()
        self.addSubview( thirdView )
        
        let fourthView = UIView( frame: CGRect( x: self.frame.width * 3, y: 0, width: self.frame.width, height: self.frame.height ) )
        fourthView.backgroundColor = UIColor.blackColor()
        self.addSubview( fourthView )
        
        self.contentSize = CGSizeMake( fourthView.frame.origin.x + fourthView.frame.width, self.frame.height )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
