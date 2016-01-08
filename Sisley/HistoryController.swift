//
//  HistoryController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 07/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class HistoryController: UIViewController, CustomWebViewDelegate, SliderHistoryViewDelegate, NavigationViewDelegate {
    
    var titleLabel: CustomTitle!
    var webView: CustomWebView!
    var navigationMenuButton: NavigationMenuButton!
    var navigationView: NavigationView!
    var sharingMenuButton: SharingMenuButton!
    var activityView: HistoryActivityView!
    var customSlider: SliderHistoryView!
    var idle: Bool = false
    var index: Int = 0
    var direction: Bool = true
    var previousValue: Int = 0
    var data: [ [ String : String ] ] = [ [ : ] ]
    var formatter: NSNumberFormatter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data = [
            [ "header": "Le 8 Janvier", "mainText": "Crème hydratante", "secondText": "+ un thé gourmand", "heart" : "false", "stress": "1.0", "tiredness": "1.0", "mood": "1.0" ],
            [ "header": "Le 7 Janvier", "mainText": "Masque givre au tilleul", "secondText": "+ une recette de grand-mère", "heart" : "true", "stress": "0.0", "tiredness": "5.0", "mood": "9.0" ],
            [ "header": "Le 6 Janvier", "mainText": "Eau florale", "secondText": "+ yoga", "heart" : "true", "stress": "10.0", "tiredness": "7.0", "mood": "5.0" ],
            [ "header": "Le 5 Janvier", "mainText": "Lotion pamplemouse", "secondText": "+ un cocktail aux légumes", "heart" : "false", "stress": "5.0", "tiredness": "10.0", "mood": "6.0" ],
            [ "header": "Le 4 Janvier", "mainText": "Crème hydratante", "secondText": "+ un thé gourmand", "heart" : "true", "stress": "10.0", "tiredness": "2.0", "mood": "7.0" ]
        ]
        
        self.view.backgroundColor = UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0 )
        
        self.webView = CustomWebView( frame: self.view.frame )
        self.webView.customWebViewDelegate = self
        self.view.addSubview( self.webView )
        
        let maskView = UIView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ) )
        maskView.backgroundColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 )
        
        let viewPath = UIBezierPath( rect: self.view.frame )
        let circlePath = UIBezierPath( ovalInRect: CGRect( x: 40, y: self.view.frame.height / 2 - 27, width: self.view.frame.width - 80, height: self.view.frame.width - 80 ) )
        viewPath.usesEvenOddFillRule = true
        viewPath.appendPath( circlePath )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = viewPath.CGPath
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.fillColor = UIColor.whiteColor().CGColor
        
        maskView.layer.mask = maskLayer
        self.view.addSubview( maskView )
        
        self.titleLabel = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        self.titleLabel.text = "Mon évolution"
        self.titleLabel.font = UIFont( name: "Santana", size: 20.0 )
        self.titleLabel.textAlignment = .Center
        self.titleLabel.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.view.addSubview( self.titleLabel )
        
        self.activityView = HistoryActivityView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ), data: self.data[ self.index ] )
        self.view.addSubview( self.activityView )
        
        self.customSlider = SliderHistoryView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width * 0.9, height: self.view.frame.width * 0.9 ) )
        self.customSlider.center.x = self.view.center.x
        self.customSlider.center.y = self.view.center.y + 120
        self.view.addSubview( self.customSlider )
        self.customSlider.delegate = self
        
        self.navigationView = NavigationView( frame: self.view.frame )
        self.navigationView.delegate = self
        self.navigationMenuButton = NavigationMenuButton( frame: CGRect( x: 25, y: self.view.frame.height + 70, width: 50, height: 50 ), menuView: self.navigationView )
        
        let sharingView = SharingView( frame: self.view.frame )
        self.sharingMenuButton = SharingMenuButton( frame: CGRect( x: self.view.frame.width - 75, y: self.view.frame.height + 70, width: 50, height: 50 ), menuView: sharingView )
        
        self.view.addSubview( self.sharingMenuButton )
        self.view.addSubview( self.navigationView )
        self.view.addSubview( self.navigationMenuButton )
        self.view.addSubview( sharingView )
        
        self.formatter = NSNumberFormatter()
        self.formatter.locale = NSLocale(localeIdentifier: "en-US")
        
        self.titleLabel.alpha = 0.0
        self.webView.alpha = 0.0
        self.customSlider.alpha = 0.0
        self.activityView.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration( 0.5, animations: {
            self.titleLabel.alpha = 1.0
            self.webView.alpha = 1.0
            self.customSlider.alpha = 1.0
            self.activityView.alpha = 1.0
            self.hideUserInterface( false )
        } )
    }
    
    func getValue( value: Int ) {
        if value > self.previousValue || value == self.previousValue {
            self.direction = true
        } else {
            self.direction = false
        }
        
        if self.idle == true {
            self.idle = false
            
            if self.direction == true {
                if self.index != self.data.count - 1 {
                    self.index++
                }
            } else {
                if self.index != 0 {
                    self.index--
                }
            }
            
            self.webView.buildFlowerWithParams( CGFloat( self.formatter.numberFromString( self.data[ self.index ][ "stress" ]! )! ), tiredness: CGFloat( self.formatter.numberFromString( self.data[ self.index ][ "tiredness" ]! )! ), mood: CGFloat( self.formatter.numberFromString( self.data[ self.index ][ "mood" ]! )! ) )
            
            self.activityView.header.title.text = self.data[ self.index ][ "header" ]
            self.activityView.etiquette.title.text = self.data[ self.index ][ "mainText" ]
            self.activityView.etiquette.subtitle.text = self.data[ self.index ][ "secondText" ]
            self.activityView.etiquette.toggleHeart( self.data[ self.index ][ "heart" ]! )
        }
        
        self.previousValue = value
    }
    
    func hideUserInterface( state: Bool ) {
        if state == true {
            self.titleLabel.alpha = 0.0
            self.navigationMenuButton.frame.origin.y = self.view.frame.height + 70
            self.sharingMenuButton.frame.origin.y = self.view.frame.height + 70
            self.webView.alpha = 0.0
        } else {
            self.titleLabel.alpha = 1.0
            self.navigationMenuButton.frame.origin.y = self.view.frame.height - 70
            self.sharingMenuButton.frame.origin.y = self.view.frame.height - 70
            self.webView.alpha = 1.0
        }
    }
    
    func navigationButtonTapped( type: String ) {
        if type == "cures" {
            UIView.animateWithDuration( 0.5, animations: {
                self.navigationView.alpha = 0.0
                self.hideUserInterface( true )
            }, completion: { finished in
                let storyboard: UIStoryboard = UIStoryboard( name: "Cures", bundle: nil )
                let vc = storyboard.instantiateViewControllerWithIdentifier( "CuresPage" ) as! CuresController
                self.navigationController?.pushViewController(vc, animated: false)
//              self.presentViewController( vc, animated: false, completion: nil )
            } )
        }
        
        if type == "flower" {
            UIView.animateWithDuration( 0.5, animations: {
                self.navigationView.alpha = 0.0
                self.hideUserInterface( true )
            }, completion: { finished in
                let storyboard: UIStoryboard = UIStoryboard( name: "Flower", bundle: nil )
                let vc = storyboard.instantiateViewControllerWithIdentifier( "FlowerPage" ) as! FlowerController
                self.navigationController?.pushViewController(vc, animated: false)
//              self.presentViewController( vc, animated: false, completion: nil )
            } )
        }
    }
    
    func listenTransitionState( params: [ String : String ] ) {
        if params[ "type" ] == "grow" {
            self.idle = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}