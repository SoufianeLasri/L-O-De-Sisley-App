//
//  NavigationView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 18/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    
//    var navigationMenuButton: NavigationMenuButton = NavigationMenuButton()
    var openingState: Bool = false
    var buttons: [ NavigationButton ] = []
    var items: [ [ String: String ] ] = []
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.items = [
            [ "title" : "Mes soins Sisley",
              "image" : "soins.png"
            ],
            [ "title" : "Mon évolution",
              "image" : "evolution.png"
            ],
            [ "title" : "Mon orchidée",
              "image" : "orchidee.png"
            ],
            [ "title" : "Mon profil",
                "image" : "profil.png"
            ]
        ]
        
        self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
        
//        self.navigationMenuButton = NavigationMenuButton( frame: CGRect( x: 15, y: self.frame.height - 75, width: 60, height: 60 ) )
//        let tapRecognizer = UITapGestureRecognizer( target: self, action: "detectTap:" )
//        self.navigationMenuButton.gestureRecognizers = [ tapRecognizer ]
//        self.addSubview( self.navigationMenuButton )
        
        for var i = 0; i < self.items.count; i++ {
            let button = NavigationButton( frame: CGRect( x: 15, y: self.frame.height - CGFloat( 75 + 70 * ( i + 1 ) ), width: 60, height: 60 ), text: self.items[ i ][ "title" ]!, imageName: self.items[ i ][ "image" ]!  )
            self.buttons.append( button )
            self.addSubview( button )
        }
        
        self.hidden = true
    }

    func detectTap( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            toggleNavigationMenu()
        }
    }
    
    func toggleNavigationMenu() {
        self.openingState = !self.openingState
        
        if self.openingState == true {
            self.hidden = false
            
            var delay = 0.0
            
            UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.7 )
//                self.navigationMenuButton.toggleButton( self.openingState )
            }, completion: nil )
            
            for item in self.buttons {
                UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                    item.toggleButton( self.openingState )
                }, completion: nil )
                
                delay += 0.1
            }
        } else {
            // Calcul pour que le delais soit proportionnel au nombre d'item dans le menu
            // S'il y a 4 items, le delais sera de 0.3s
            // var delay = 0.3
            var delay = Double( self.items.count ) / 10.0 - 0.1
            
//            let chrono = delay * Double( NSEC_PER_SEC )
//            let time = dispatch_time( DISPATCH_TIME_NOW, Int64( chrono ) )
//            dispatch_after( time, dispatch_get_main_queue() ) {
//                for item in self.navigationMenuButton.layer.sublayers! {
//                    item.removeAnimationForKey( "strokeColor" )
//                }
//            }
            
            UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
//                self.navigationMenuButton.toggleButton( self.openingState )
            }, completion: { finished in
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
