//
//  ReactionEtiquetteView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 29/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class ReactionEtiquetteView: UIView {
    init( frame: CGRect, flowerImage: String, heartImage: String, name: String, reaction: String ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor.whiteColor()
        
        let nameLabel = UILabel( frame: CGRect( x: 100, y: 15, width: self.frame.width, height: 20 ) )
        nameLabel.text = name
        nameLabel.font = UIFont( name: "Bellota-Bold", size: 17.0 )
        nameLabel.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.addSubview( nameLabel )
        
        let reactionLabel = UITextView( frame: CGRect( x: 95, y: 32, width: self.frame.width, height: self.frame.height - 35 ) )
        reactionLabel.text = reaction
        reactionLabel.font = UIFont( name: "Bellota-Regular", size: 14.0 )
        reactionLabel.editable = false
        reactionLabel.selectable = false
        reactionLabel.scrollEnabled = true
        reactionLabel.bounces = false
        reactionLabel.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.addSubview( reactionLabel )
        
        let flowerImageView = UIImageView( frame: CGRect( x: 20, y: 0, width: 70, height: 70 ) )
        flowerImageView.image = UIImage( named: flowerImage )
        flowerImageView.center.y = self.frame.height / 2
        self.addSubview( flowerImageView )
        
        let likeImageView = UIImageView( frame: CGRect( x: self.frame.width - 40, y: 15, width: 25, height: 25 ) )
        likeImageView.image = UIImage( named: heartImage )
        self.addSubview( likeImageView )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}