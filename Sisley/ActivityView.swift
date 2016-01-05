//
//  ActivityView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 02/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class ActivityView: UIView, CustomCarouselDelegate {
    
    var carousel: CustomCarouselController!
    var sharingMenuButton: SharingMenuButton!
    var validateActivityButton: ValidateButton!
    var closeButton: CloseButton!
    var openingState: Bool = true
    
    init( frame: CGRect, data: [ String : Dictionary<String, NSObject> ] ) {
        super.init( frame: frame )
        
        let header = HeaderView( frame: CGRect( x: 0, y: 100, width: self.frame.width - 60, height: 42 ), data: data[ "header" ] as! [ String : String ] )
        header.center.x = self.center.x
        self.addSubview( header )
        
        let etiquette = EtiquetteView( frame: CGRect( x: 0, y: header.frame.maxY, width: self.frame.width - 60, height: 140 ), data: data[ "etiquette" ] as! [ String : String ] )
        etiquette.center.x = self.center.x
        let tapEtiquetteRecognizer = UITapGestureRecognizer( target: self, action: "openEtiquette:" )
        etiquette.addGestureRecognizer( tapEtiquetteRecognizer )
        self.addSubview( etiquette )
        
        self.carousel = CustomCarouselController( frame: CGRect( x: 0, y: etiquette.frame.maxY + 3, width: self.frame.width - 60, height: self.frame.height - etiquette.frame.maxY - 25 ), data: data[ "carousel" ]! )
        self.carousel.center.x = self.center.x
        self.carousel.customDelegate = self
        self.addSubview( self.carousel )
        
        for item in carousel.dots {
            item.frame.origin.y = self.frame.height - 50
            self.addSubview( item )
        }
        
        self.validateActivityButton = ValidateButton( frame: CGRect( x: 45, y: self.frame.height - 92, width: 55, height: 55 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 ) )
        self.addSubview( self.validateActivityButton )
        
        self.closeButton = CloseButton(frame: CGRect( x: header.frame.width - 0, y: header.frame.origin.y + 12, width: 20, height: 20 ) )
        let tapCloseRecognizer = UITapGestureRecognizer( target: self, action: "closeEtiquette:" )
        self.closeButton.addGestureRecognizer( tapCloseRecognizer )
        self.addSubview( self.closeButton )
        
        let sharingView = SharingView( frame: self.frame )
        self.sharingMenuButton = SharingMenuButton( frame: CGRect( x: self.frame.width - 100, y: self.frame.height - 92, width: 55, height: 55 ), menuView: sharingView )
        self.addSubview( self.sharingMenuButton )
        self.addSubview( sharingView )
    }
    
    func toggleButtons( index: Int ) {
        if index == 2 {
            UIView.animateWithDuration( 0.3, animations: {
                self.validateActivityButton.alpha = 0.0
                self.sharingMenuButton.alpha = 0.0
                }, completion: nil )
        } else {
            UIView.animateWithDuration( 0.3, animations: {
                self.validateActivityButton.alpha = 1.0
                self.sharingMenuButton.alpha = 1.0
                }, completion: nil )
        }
    }
    
    func openEtiquette( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            self.openingState = true
            
            if self.openingState == true {
                UIView.animateWithDuration( 0.3, animations: {
                    self.closeButton.toggleButton( self.openingState )
                    self.carousel.alpha = 1.0
                    self.sharingMenuButton.alpha = 1.0
                    self.validateActivityButton.alpha = 1.0
                    
                    for item in self.carousel.dots {
                        item.alpha = 1.0
                    }
                } )
            }
        }
    }
    
    func closeEtiquette( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            self.openingState = false
            
            if self.openingState == false {
                UIView.animateWithDuration( 0.3, animations: {
                    self.closeButton.toggleButton( self.openingState )
                    self.carousel.alpha = 0.0
                    self.sharingMenuButton.alpha = 0.0
                    self.validateActivityButton.alpha = 0.0
                    
                    for item in self.carousel.dots {
                        item.alpha = 0.0
                    }
                } )
            }
        }
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
