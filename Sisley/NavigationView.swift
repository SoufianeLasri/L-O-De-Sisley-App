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
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
        self.expandButton = ExpandButton(frame: CGRect( x: 25, y: self.frame.height - 75, width: 50, height: 50 ) )
        let tapRecognizer = UITapGestureRecognizer( target: self, action: "detectTap:" )
        self.expandButton.gestureRecognizers = [ tapRecognizer ]
        self.addSubview( self.expandButton )
    }

    func detectTap( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            toggleNavigationMenu()
        }
    }
    
    func toggleNavigationMenu() {
        self.openingState = !self.openingState
        if self.openingState == true {
            UIView.animateWithDuration( 0.3, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.7 )
                self.expandButton.toggleButton( self.openingState )
            })
        } else {
            UIView.animateWithDuration( 0.3, animations: {
                self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.0 )
                self.expandButton.toggleButton( self.openingState )
            })
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
