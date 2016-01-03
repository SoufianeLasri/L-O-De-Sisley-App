//
//  EtiquetteView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 26/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class EtiquetteView: UIView {
    
    var likeButton: LikeButton!
    
    init( frame: CGRect, data: [ String : String ] ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor.whiteColor()
        
        let title = UILabel( frame: CGRect( x: 0, y: self.frame.height / 2 - 40, width: self.frame.width, height: 50 ) )
        title.text = data[ "mainText" ]
        title.font = UIFont( name: "Santana-Bold", size: 28.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.addSubview( title )
        
        let subtitle = UILabel( frame: CGRect( x: 0, y: self.frame.height / 2 - 10, width: self.frame.width, height: 50 ) )
        subtitle.text = "+ " + data[ "secondText" ]!
        subtitle.font = UIFont( name: "Bellota-Italic", size: 20.0 )
        subtitle.textAlignment = .Center
        subtitle.textColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        self.addSubview( subtitle )
        
        self.likeButton = LikeButton( frame: CGRect( x: self.frame.width - 40, y: 15, width: 25, height: 25 ) )
        let tapRecognizer = UITapGestureRecognizer( target: self, action: "toggleLike:" )
        self.likeButton.gestureRecognizers = [ tapRecognizer ]
        self.addSubview( self.likeButton )
    }
    
    func toggleLike( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            self.likeButton.toggleButton()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
