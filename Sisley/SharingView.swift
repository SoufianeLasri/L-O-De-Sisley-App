//
//  SharingView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 25/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class SharingView: UIView {
    
    var label: UILabel = UILabel()
    var sharingMenuButton: SharingMenuButton = SharingMenuButton()
    var sharingCloseButton: SharingCloseButton = SharingCloseButton()
    var openingState: Bool = false
    var buttons: [ SharingButton ] = []
    var items: [ String ] = []
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.items = [ "facebook", "twitter", "pinterest" ]
        
        self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
        
        self.label = UILabel( frame: CGRect( x: 0, y: self.frame.height / 2 - 200, width: self.frame.width, height: 80 ) )
        self.label.text = "Je souhaite partager\nmon orchidée"
        self.label.numberOfLines = 2
        self.label.font = UIFont( name: "Santana-Bold", size: 30.0 )
        self.label.textColor = UIColor.whiteColor()
        self.label.textAlignment = .Center
        self.label.alpha = 0
        self.label.frame.origin.y += 5
        self.addSubview( self.label )
        
        self.sharingCloseButton = SharingCloseButton( frame: CGRect( x: self.frame.width / 2 - 30, y: self.frame.height - 75, width: 60, height: 60 ) )
        self.sharingCloseButton.alpha = 0
        self.sharingCloseButton.frame.origin.y += 5
        let closingTap = UITapGestureRecognizer( target: self, action: "closeMenu:" )
        self.sharingCloseButton.addGestureRecognizer( closingTap )
        self.addSubview( self.sharingCloseButton )
        
        for var i = 0; i < self.items.count; i++ {
            let button = SharingButton( frame: CGRect( x: self.frame.width / 2 - 30 + CGFloat( 100 * ( i - 1 ) ), y: self.frame.height / 2 - 80, width: 60, height: 60 ), imageName: self.items[ i ]  )
            self.buttons.append( button )
            self.addSubview( button )
        }
        
        self.hidden = true
    }
    
    func openMenu() {
        self.hidden = false
        self.openingState = true
        
        var delay = 0.0
            
        UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
            self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.7 )
            self.sharingMenuButton.toggleButton( self.openingState )
            self.label.alpha = 1
            self.label.frame.origin.y -= 5
            self.sharingCloseButton.alpha = 1
            self.sharingCloseButton.frame.origin.y -= 5
        }, completion: { finished in
            self.sharingMenuButton.enabled = false
            self.sharingCloseButton.enabled = true
        } )
            
        for item in self.buttons {
            UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                item.toggleButton( self.openingState )
            }, completion: nil )
            
            delay += 0.1
        }
    }
    
    func closeMenu( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            self.openingState = false
        
            var delay = 0.3
        
            UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
                self.sharingMenuButton.toggleButton( self.openingState )
                self.label.alpha = 0
                self.label.frame.origin.y += 5
                self.sharingCloseButton.alpha = 0
                self.sharingCloseButton.frame.origin.y += 5
            }, completion: { finished in
                self.sharingMenuButton.enabled = true
                self.sharingCloseButton.enabled = false
                self.hidden = true
            } )
        
            for item in self.buttons {
                UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                    item.toggleButton( self.openingState )
                }, completion: nil )
            
                delay -= 0.1
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}