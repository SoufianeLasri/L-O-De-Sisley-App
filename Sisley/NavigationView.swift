//
//  NavigationView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 18/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    
    var expandButton: ExpandButton = ExpandButton()
    var openingState: Bool = false
    var buttons: [ NavigationButton ] = []
    var labels: [ String ] = []
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.labels = [ "Mes soins Sisley", "Mon évolution", "Mon orchidée", "Mon profil" ]
        
        self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
        self.expandButton = ExpandButton( frame: CGRect( x: 25, y: self.frame.height - 75, width: 50, height: 50 ) )
        let tapRecognizer = UITapGestureRecognizer( target: self, action: "detectTap:" )
        self.expandButton.gestureRecognizers = [ tapRecognizer ]
        self.addSubview( self.expandButton )
        
        for i in 0..<4 {
            let button = NavigationButton( frame: CGRect( x: 5, y: self.frame.height - CGFloat( 75 + 60 * ( i + 1 ) ), width: 50, height: 50 ), text: self.labels[ i ] )
            self.buttons.append( button )
            self.addSubview( button )
        }
    }

    func detectTap( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            toggleNavigationMenu()
        }
    }
    
    func toggleNavigationMenu() {
        self.openingState = !self.openingState
        
        if self.openingState == true {
            var delay = 0.0
            
            UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.7 )
                self.expandButton.toggleButton( self.openingState )
            }, completion: nil )
            
            for item in self.buttons {
                UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                    
                    item.toggleButton( self.openingState )
                    
                }, completion: nil )
                
                delay += 0.1
            }
        } else {
            var delay = 0.3
            
            UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
                self.expandButton.toggleButton( self.openingState )
            }, completion: nil )
            
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
