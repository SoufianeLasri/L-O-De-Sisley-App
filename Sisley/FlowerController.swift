//
//  FlowerController.swift
//  Sisley
//
//  Created by BOULAY Jeremie on 06/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class FlowerController: UIViewController, QuizDelegate, TipsDelegate, CustomWebViewDelegate, RecapViewDelegate, NavigationViewDelegate {
    
    var titleLabel: CustomTitle!
    var callToAction: CAShapeLayer!
    var navigationMenuButton: NavigationMenuButton!
    var navigationView: NavigationView!
    var sharingMenuButton: SharingMenuButton!
    var webView: CustomWebView!
    var launchQuizButton: UIButton!
    var updateFlowerLabel: UILabel!
    var testFinished: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0 )
        
        self.titleLabel = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        self.titleLabel.text = "Mon orchidée"
        self.titleLabel.font = UIFont( name: "Santana", size: 20.0 )
        self.titleLabel.textAlignment = .Center
        self.titleLabel.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        
        self.navigationView = NavigationView( frame: self.view.frame )
        self.navigationView.delegate = self
        self.navigationMenuButton = NavigationMenuButton( frame: CGRect( x: 25, y: self.view.frame.height + 75, width: 50, height: 50 ), menuView: self.navigationView )
        
        let sharingView = SharingView( frame: self.view.frame )
        self.sharingMenuButton = SharingMenuButton( frame: CGRect( x: self.view.frame.width - 75, y: self.view.frame.height + 75, width: 50, height: 50 ), menuView: sharingView )
        
        self.webView = CustomWebView( frame: self.view.frame )
        self.webView.customWebViewDelegate = self
        
        let validateFeedbackPath = UIBezierPath( ovalInRect: CGRect( x: 0, y: 0, width: 100, height: 100 ) )
        self.callToAction = CAShapeLayer()
        self.callToAction.frame = CGRect( x: self.view.frame.width / 2 - 50, y: self.view.frame.height - 270, width: 100, height: 100 )
        self.callToAction.path = validateFeedbackPath.CGPath
        self.callToAction.fillColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 0.0 ).CGColor
        self.view.layer.addSublayer( self.callToAction )
        
        self.view.addSubview( self.webView )
        self.view.addSubview( self.titleLabel )
        
        self.updateFlowerLabel = UILabel( frame: CGRect( x: 0, y: 155, width: self.view.frame.width, height: 80 ) )
        self.updateFlowerLabel.text = "Actualiser\nma fleur"
        self.updateFlowerLabel.font = UIFont( name: "Santana-Bold", size: 26.0 )
        self.updateFlowerLabel.numberOfLines = 2
        self.updateFlowerLabel.textAlignment = .Center
        self.updateFlowerLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.updateFlowerLabel.alpha = 0.0
        self.view.addSubview( self.updateFlowerLabel )
        
        self.launchQuizButton = UIButton( frame: CGRect( x: 0, y: 0, width: 300, height: 300 ) )
        self.launchQuizButton.center.x = self.view.center.x
        self.launchQuizButton.frame.origin.y = self.view.frame.height - 370
        self.launchQuizButton.layer.cornerRadius = 150
        let updateFlowerTap = UITapGestureRecognizer( target: self, action: "updateFlower:" )
        self.launchQuizButton.addGestureRecognizer( updateFlowerTap )
        self.launchQuizButton.enabled = false
        self.view.addSubview( self.launchQuizButton )
        
        self.view.addSubview( self.sharingMenuButton )
        self.view.addSubview( self.navigationView )
        self.view.addSubview( self.navigationMenuButton )
        self.view.addSubview( sharingView )
        
        self.titleLabel.alpha = 0.0
        self.updateFlowerLabel.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration( 0.5, animations: {
            self.webView.alpha = 1.0
            self.hideUserInterface( false )
        } )
    }
    
    func updateFlower( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            self.webView.flowerToSeed()
            self.launchQuizButton.enabled = false
            self.callToAction.opacity = 0.0
            
            UIView.animateWithDuration( 0.5, animations: {
                self.hideUserInterface( true )
                self.updateFlowerLabel.alpha = 0.0
                self.updateFlowerLabel.frame.origin.y += 5
            }, completion: { finished in
                let storyboard: UIStoryboard = UIStoryboard( name: "Quiz", bundle: nil )
                let vc = storyboard.instantiateViewControllerWithIdentifier( "QuizPage" ) as! QuizController
                vc.modalPresentationStyle = .OverCurrentContext
                vc.delegate = self
                self.presentViewController( vc, animated: false, completion: nil )
            } )
        }
    }
    
    func flowerProgress() {
        self.webView.flowerProgress()
    }
    
    func buildFlowerWithParams( data: [ CGFloat ], text: [ String ] ) {
        self.testFinished = true
        
        UIView.animateWithDuration( 0.5, animations: {
            self.hideUserInterface( false )
        } )
        
        self.webView.buildFlowerWithParams( data[ 0 ], tiredness: data[ 1 ], mood: data[ 2 ] )
        
        let recapView = RecapView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ), text: text )
        recapView.delegate = self
        self.view.addSubview( recapView )
    }
    
    func hideRecapView() {
        let storyboard: UIStoryboard = UIStoryboard( name: "Tips", bundle: nil )
        let vc = storyboard.instantiateViewControllerWithIdentifier( "TipsPage" ) as! TipsController
        vc.modalPresentationStyle = .OverCurrentContext
        vc.delegate = self
        self.presentViewController( vc, animated: false, completion: nil )
    }
    
    func hideUserInterface( state: Bool ) {
        if state == true {
            self.titleLabel.alpha = 0.0
            self.navigationMenuButton.frame.origin.y = self.view.frame.height + 70
            self.sharingMenuButton.frame.origin.y = self.view.frame.height + 70
        } else {
            self.titleLabel.alpha = 1.0
            self.navigationMenuButton.frame.origin.y = self.view.frame.height - 70
            self.sharingMenuButton.frame.origin.y = self.view.frame.height - 70
        }
    }
    
    func launchRegeneration() {
        let regenerationLabel = UILabel( frame: CGRect( x: 0, y: 155, width: self.view.frame.width, height: 80 ) )
        regenerationLabel.text = "Régénération\nen cours"
        regenerationLabel.font = UIFont( name: "Santana-Bold", size: 26.0 )
        regenerationLabel.numberOfLines = 2
        regenerationLabel.textAlignment = .Center
        regenerationLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        regenerationLabel.alpha = 0.0
        self.view.addSubview( regenerationLabel )
        
        let blurEffectView = BluryView( frame: CGRect( x: 40, y: self.view.frame.height / 2 - 27, width: self.view.frame.width - 80, height: self.view.frame.width - 80 ) )
        blurEffectView.alpha = 0.0
        self.view.insertSubview( blurEffectView, aboveSubview: self.webView )
        
        UIView.animateWithDuration( 0.5, delay: 0.7, options: .TransitionNone, animations: {
            regenerationLabel.alpha = 1.0
            regenerationLabel.frame.origin.y -= 5
            blurEffectView.alpha = 1.0
        }, completion: nil )
    }
    
    func listenTransitionState( params: [ String: String ] ) {
        if params[ "type" ] == "grow" {
            if self.testFinished == false {
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
            
                self.launchQuizButton.enabled = true
                
                UIView.animateWithDuration( 0.5, animations: {
                    self.updateFlowerLabel.alpha = 1.0
                    self.updateFlowerLabel.frame.origin.y -= 5
                } )
            }
        }
    }
    
    func navigationButtonTapped( type: String ) {
        if type == "cures" {
            UIView.animateWithDuration( 0.5, animations: {
                self.webView.alpha = 0.0
                self.navigationView.alpha = 0.0
                self.hideUserInterface( true )
            }, completion: { finished in
                let storyboard: UIStoryboard = UIStoryboard( name: "Cures", bundle: nil )
                let vc = storyboard.instantiateViewControllerWithIdentifier( "CuresPage" ) as! CuresController
                self.navigationController?.pushViewController(vc, animated: false)
//              self.presentViewController( vc, animated: false, completion: nil )
            } )
        }
        
        if type == "history" {
            UIView.animateWithDuration( 0.5, animations: {
                self.webView.alpha = 0.0
                self.navigationView.alpha = 0.0
                self.hideUserInterface( true )
            }, completion: { finished in
                let storyboard: UIStoryboard = UIStoryboard( name: "History", bundle: nil )
                let vc = storyboard.instantiateViewControllerWithIdentifier( "HistoryPage" ) as! HistoryController
                self.navigationController?.pushViewController(vc, animated: false)
//              self.presentViewController( vc, animated: false, completion: nil )
            } )
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}