//
//  LikeButton.swift
//  Sisley
//
//  Created by Soufiane Lasri on 26/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    
    var liked: Bool = false
    var heartImageView: UIImageView!
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.heartImageView = UIImageView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: self.frame.height ) )
        if self.liked == true {
            self.heartImageView.image = UIImage( named: "heartFull.png" )
        } else {
            self.heartImageView.image = UIImage( named: "heartEmpty.png" )
        }
        self.addSubview( self.heartImageView )
    }
    
    func toggleButton() {
        self.liked = !self.liked
        
        if self.liked == true {
            UIView.animateWithDuration( 0.1, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.heartImageView.transform = CGAffineTransformMakeScale( 1.1, 1.1 )
            }, completion: { finished in
                    self.heartImageView.image = UIImage( named: "heartFull.png" )
            } )
            UIView.animateWithDuration( 0.1, delay: 0.1, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.heartImageView.transform = CGAffineTransformMakeScale( 1.0, 1.0 )
            }, completion: nil )
        } else {
            UIView.animateWithDuration( 0.1, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.heartImageView.transform = CGAffineTransformMakeScale( 1.1, 1.1 )
            }, completion: { finished in
                self.heartImageView.image = UIImage( named: "heartEmpty.png" )
            } )
            UIView.animateWithDuration( 0.1, delay: 0.1, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.heartImageView.transform = CGAffineTransformMakeScale( 1.0, 1.0 )
            }, completion: nil )
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
