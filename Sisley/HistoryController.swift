//
//  HistoryController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 07/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class HistoryController: UIViewController, CustomWebViewDelegate, SliderHistoryViewDelegate, NavigationViewDelegate {
    
    var webView: CustomWebView!
    var navigationMenuButton: NavigationMenuButton!
    var sharingMenuButton: SharingMenuButton!
    var activityView: HistoryActivityView!
    var idle: Bool = false
    var index: Int = 0
    var direction: Bool = true
    var previousValue: Int = 0
    var data: [ [ String : String ] ] = [ [ : ] ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.data = [
            [ "header": "Le 8 Janvier", "mainText": "Crème hydratante", "secondText": "+ un thé gourmand", "heart" : "false", "stress": "1.0", "tiredness": "1.0", "mood": "1.0" ],
            [ "header": "Le 7 Janvier", "mainText": "Crème hydratante", "secondText": "+ un thé gourmand", "heart" : "true", "stress": "1.0", "tiredness": "4.0", "mood": "10.0" ],
            [ "header": "Le 6 Janvier", "mainText": "Eau florale", "secondText": "+ yoga", "heart" : "true", "stress": "10.0", "tiredness": "7.0", "mood": "5.0" ],
            [ "header": "Le 5 Janvier", "mainText": "Lotion pamplemouse", "secondText": "+ un cocktail aux légumes", "heart" : "false", "stress": "5.0", "tiredness": "10.0", "mood": "6.0" ],
            [ "header": "Le 4 Janvier", "mainText": "Masque givre au tilleul", "secondText": "+ une recette de grand-mère", "heart" : "true", "stress": "2.0", "tiredness": "2.0", "mood": "7.0" ],
            [ "header": "Le 3 Janvier", "mainText": "Crème hydratante", "secondText": "+ yoga", "heart" : "true", "stress": "7.0", "tiredness": "9.0", "mood": "1.0" ],
            [ "header": "Le 2 Janvier", "mainText": "Crème hydratante", "secondText": "+ yoga", "heart" : "false", "stress": "2.0", "tiredness": "6.0", "mood": "9.0" ],
            [ "header": "Le 1 Janvier", "mainText": "Crème hydratante", "secondText": "+ yoga", "heart" : "true", "stress": "8.0", "tiredness": "2.0", "mood": "2.0" ],
            [ "header": "Le 31 Décembre", "mainText": "Crème hydratante", "secondText": "+ yoga", "heart" : "true", "stress": "3.0", "tiredness": "9.0", "mood": "3.0" ],
            [ "header": "Le 30 Décembre", "mainText": "Crème hydratante", "secondText": "+ yoga", "heart" : "true", "stress": "10.0", "tiredness": "1.0", "mood": "10.0" ],
            [ "header": "Le 29 Décembre", "mainText": "Crème hydratante", "secondText": "+ yoga", "heart" : "false", "stress": "7.0", "tiredness": "10.0", "mood": "4.0" ],
            [ "header": "Le 28 Décembre", "mainText": "Crème hydratante", "secondText": "+ yoga", "heart" : "true", "stress": "4.0", "tiredness": "3.0", "mood": "3.0" ]
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
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        title.text = "Mon évolution"
        title.font = UIFont( name: "Santana", size: 20.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.view.addSubview( title )
        
        self.activityView = HistoryActivityView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ), data: self.data[ self.index ] )
        self.view.addSubview( self.activityView )
        
        let customSlider = SliderHistoryView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width * 0.9, height: self.view.frame.width * 0.9 ) )
        customSlider.center.x = self.view.center.x
        customSlider.center.y = self.view.center.y + 120
        self.view.addSubview( customSlider )
        customSlider.delegate = self
        
        let navigationView = NavigationView( frame: self.view.frame )
        navigationView.delegate = self
        self.navigationMenuButton = NavigationMenuButton( frame: CGRect( x: 25, y: self.view.frame.height - 70, width: 50, height: 50 ), menuView: navigationView )
        
        let sharingView = SharingView( frame: self.view.frame )
        self.sharingMenuButton = SharingMenuButton( frame: CGRect( x: self.view.frame.width - 75, y: self.view.frame.height - 70, width: 50, height: 50 ), menuView: sharingView )
        
        self.view.addSubview( self.sharingMenuButton )
        self.view.addSubview( navigationView )
        self.view.addSubview( self.navigationMenuButton )
        self.view.addSubview( sharingView )
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
            
            self.webView.buildFlowerWithParams( CGFloat( NSNumberFormatter().numberFromString( self.data[ self.index ][ "stress" ]! )! ), tiredness: CGFloat( NSNumberFormatter().numberFromString( self.data[ self.index ][ "tiredness" ]! )! ), mood: CGFloat( NSNumberFormatter().numberFromString( self.data[ self.index ][ "mood" ]! )! ) )
            
            self.activityView.header.title.text = self.data[ self.index ][ "header" ]
            self.activityView.etiquette.title.text = self.data[ self.index ][ "mainText" ]
            self.activityView.etiquette.subtitle.text = self.data[ self.index ][ "secondText" ]
            self.activityView.etiquette.toggleHeart( self.data[ self.index ][ "heart" ]! )
        }
        
        self.previousValue = value
    }
    
    func navigationButtonTapped( type: String ) {
        if type == "cures" {
            print( "yo" )
        }
        
        if type == "flower" {
            let storyboard: UIStoryboard = UIStoryboard( name: "Flower", bundle: nil )
            let vc = storyboard.instantiateViewControllerWithIdentifier( "FlowerPage" ) as! FlowerController
            self.navigationController?.pushViewController(vc, animated: false)
//            self.presentViewController( vc, animated: false, completion: nil )
        }
    }
    
    func listenTransitionState( params: [ String : String ] ) {
        if params[ "type" ] == "grow" {
            self.idle = true
        }
    }
}