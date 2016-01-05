//
//  FlowerController.swift
//  Sisley
//
//  Created by BOULAY Jeremie on 06/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class FlowerController: UIViewController {
    
    var callToAction: CAShapeLayer!
    var navigationMenuButton: NavigationMenuButton!
    var sharingMenuButton: SharingMenuButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0 )
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ) )
        title.text = "Mon orchidée"
        title.font = UIFont( name: "Santana", size: 23.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        let navigationView = NavigationView( frame: self.view.frame )
        self.navigationMenuButton = NavigationMenuButton( frame: CGRect( x: 25, y: self.view.frame.height + 75, width: 50, height: 50 ), menuView: navigationView )
        
        let sharingView = SharingView( frame: self.view.frame )
        self.sharingMenuButton = SharingMenuButton( frame: CGRect( x: self.view.frame.width - 75, y: self.view.frame.height + 75, width: 50, height: 50 ), menuView: sharingView )
        
        let webView = CustomWebView( frame: self.view.frame )
        
        let validateFeedbackPath = UIBezierPath( ovalInRect: CGRect( x: 0, y: 0, width: 100, height: 100 ) )
        self.callToAction = CAShapeLayer()
        self.callToAction.frame = CGRect( x: self.view.frame.width / 2 - 50, y: self.view.frame.height - 200, width: 100, height: 100 )
        self.callToAction.path = validateFeedbackPath.CGPath
        self.callToAction.fillColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 ).CGColor
        self.view.layer.addSublayer( self.callToAction )
        
        self.view.addSubview( webView )
        self.view.addSubview( title )
        
        self.view.addSubview( self.sharingMenuButton )
        self.view.addSubview( navigationView )
        self.view.addSubview( self.navigationMenuButton )
        self.view.addSubview( sharingView )
    }
    
    override func viewDidAppear(animated: Bool) {
        let radiusAnimation         = CABasicAnimation( keyPath: "transform.scale" )
        radiusAnimation.duration    = 1.5
        radiusAnimation.fromValue   = 1.0
        radiusAnimation.toValue     = 3.3
        radiusAnimation.repeatCount = .infinity
        self.callToAction.addAnimation( radiusAnimation, forKey: "transform.scale" )
        
        let fillColorAnimation         = CAKeyframeAnimation( keyPath: "fillColor" )
        fillColorAnimation.duration    = 1.5
        fillColorAnimation.keyTimes    = [ 0.0, 0.5, 1.0 ]
        fillColorAnimation.values      = [
            UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 0.0 ).CGColor,
            UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 ).CGColor,
            UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 0.0 ).CGColor
        ]
        fillColorAnimation.repeatCount = .infinity
        self.callToAction.addAnimation( fillColorAnimation, forKey: "fillColor" )
        
        UIView.animateWithDuration( 0.5, animations: {
            self.navigationMenuButton.frame.origin.y = self.view.frame.height - 70
            self.sharingMenuButton.frame.origin.y = self.view.frame.height - 70
        } )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}