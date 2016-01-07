//
//  BluryView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 07/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class BluryView: UIView {
    override init( frame: CGRect ) {
        super.init( frame: frame )
    
        self.layer.cornerRadius = self.frame.width / 2
        self.backgroundColor = UIColor(red:0.78, green:0.82, blue:0.85, alpha:0.45)
        
        let bubbleImageView = UIImageView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        bubbleImageView.image = UIImage( named: "bubble.png" )
        self.addSubview( bubbleImageView )
        
        let purchaseImageView = UIImageView( frame: CGRect( x: 0, y: 0, width: 50, height: 50 ) )
        purchaseImageView.image = UIImage( named: "purchase.png" )
        purchaseImageView.center = CGPoint( x: self.frame.width / 2, y: self.frame.height / 2 - 15 )
        self.addSubview( purchaseImageView )
        
        let goToShopLabel = UILabel( frame: CGRect( x: 0, y: self.frame.height / 2 + 15, width: self.frame.width, height: 60 ) )
        goToShopLabel.text = "Retrouvez ce soin\nen boutique"
        goToShopLabel.numberOfLines = 2
        goToShopLabel.font = UIFont( name: "Bellota-Bold", size: 17.0 )
        goToShopLabel.textAlignment = .Center
        goToShopLabel.textColor = UIColor.whiteColor()
        self.addSubview( goToShopLabel )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}