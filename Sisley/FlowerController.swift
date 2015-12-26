//
//  FlowerController.swift
//  Sisley
//
//  Created by BOULAY Jeremie on 06/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class FlowerController: UIViewController {
    
    //TODO  : charger le menu ou le quizz
    var webView: CustomWebViewController? = nil
    var navigationMenuButton: NavigationMenuButton = NavigationMenuButton()
    var navigationView: NavigationView = NavigationView()
    var sharingView: SharingView = SharingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ) )
        title.text = "Mon orchidée"
        title.font = UIFont( name: "Santana", size: 23.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        self.navigationMenuButton = NavigationMenuButton( frame: CGRect( x: 15, y: self.view.frame.height - 75, width: 60, height: 60 ) )
        let tapRecognizer = UITapGestureRecognizer( target: self, action: "openNavigationMenu:" )
        self.navigationMenuButton.gestureRecognizers = [ tapRecognizer ]
        self.navigationView = NavigationView( frame: self.view.frame )
        
        let sharingMenuButton = SharingMenuButton( frame: CGRect( x: self.view.frame.width - 75, y: self.view.frame.height - 75, width: 60, height: 60 ) )
        let openingTap = UITapGestureRecognizer( target: self, action: "openSharingMenu:" )
        sharingMenuButton.addGestureRecognizer( openingTap )
        self.sharingView = SharingView( frame: self.view.frame )
        
        self.webView = CustomWebViewController( frame: self.view.frame )
        
        self.view.addSubview( self.webView! )
        self.view.addSubview( title )
        
        
        self.view.addSubview( sharingMenuButton )
        self.view.addSubview( self.navigationView )
        self.view.addSubview( navigationMenuButton )
        self.view.addSubview( self.sharingView )
    }
    
    func openNavigationMenu( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            self.navigationView.toggleNavigationMenu()
            
            if self.navigationView.openingState == true {
                UIView.animateWithDuration( 0.3, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: {
                    self.navigationMenuButton.toggleButton( true )
                }, completion: nil )
            } else {
                let chrono = 0.3 * Double( NSEC_PER_SEC )
                let time = dispatch_time( DISPATCH_TIME_NOW, Int64( chrono ) )
                dispatch_after( time, dispatch_get_main_queue() ) {
                    for item in self.navigationMenuButton.layer.sublayers! {
                        item.removeAnimationForKey( "strokeColor" )
                    }
                }
                
                UIView.animateWithDuration( 0.3, delay: 0.3, options: UIViewAnimationOptions.TransitionNone, animations: {
                    self.navigationMenuButton.toggleButton( false )
                }, completion: nil )
            }
        }
    }
    
    func openSharingMenu( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            self.sharingView.openMenu()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}