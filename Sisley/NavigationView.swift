//
//  NavigationView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 18/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

protocol NavigationViewDelegate: class {
    func navigationButtonTapped( type: String )
}

class NavigationView: UIView {
    
    var openingState: Bool = false
    var buttons: [ NavigationButton ] = []
    var items: [ [ String: String ] ] = []
    var delegate: NavigationViewDelegate?
    
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
        
        for var i = 0; i < self.items.count; i++ {
            let button = NavigationButton( frame: CGRect( x: 25, y: self.frame.height - CGFloat( 70 + 60 * ( i + 1 ) ), width: 50, height: 50 ), text: self.items[ i ][ "title" ]!, imageName: self.items[ i ][ "image" ]!  )
            self.buttons.append( button )
            self.addSubview( button )
        }
        
        let openCures = UITapGestureRecognizer( target: self, action: "openCures:" )
        self.buttons[ 0 ].addGestureRecognizer( openCures )
        
        let openEvolution = UITapGestureRecognizer( target: self, action: "openEvolution:" )
        self.buttons[ 1 ].addGestureRecognizer( openEvolution )
        
        let openFlower = UITapGestureRecognizer( target: self, action: "openFlower:" )
        self.buttons[ 2 ].addGestureRecognizer( openFlower )
        
        self.hidden = true
    }
    
    func openCures( sender: UITapGestureRecognizer ) {
        self.delegate?.navigationButtonTapped( "cures" )
    }
    
    func openEvolution( sender: UITapGestureRecognizer ) {
        self.delegate?.navigationButtonTapped( "history" )
    }
    
    func openFlower( sender: UITapGestureRecognizer ) {
        self.delegate?.navigationButtonTapped( "flower" )
    }
    
    func toggleNavigationMenu() {
        self.openingState = !self.openingState
        
        if self.openingState == true {
            self.hidden = false
            
            var delay = 0.0
            
            UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.7 )
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
            
            UIView.animateWithDuration( 0.3, delay: delay, options: UIViewAnimationOptions.TransitionNone, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
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
