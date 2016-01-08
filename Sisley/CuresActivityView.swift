//
//  CuresActivityView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 08/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

protocol CuresActivityDelegate: class {
    func closeActivity()
}

class CuresActivityView: UIView {
    
    var carousel: CustomCarouselView!
    var sharingMenuButton: SharingMenuButton!
    var validateActivityButton: ValidateButton!
    var closeButton: CloseButton!
    var delegate: CuresActivityDelegate?
    
    init( frame: CGRect, data: [ String : Dictionary<String, NSObject> ] ) {
        super.init( frame: frame )
        
        let header = HeaderView( frame: CGRect( x: 0, y: 95, width: self.frame.width - 60, height: 40 ), data: data[ "header" ] as! [ String : String ] )
        header.center.x = self.center.x
        self.addSubview( header )
        
        let etiquette = EtiquetteView( frame: CGRect( x: 0, y: header.frame.maxY, width: self.frame.width - 60, height: 120 ), data: data[ "etiquette" ] as! [ String : String ] )
        etiquette.center.x = self.center.x
        self.addSubview( etiquette )
        
        self.carousel = CustomCarouselView( frame: CGRect( x: 0, y: etiquette.frame.maxY + 3, width: self.frame.width - 60, height: self.frame.height - etiquette.frame.maxY - 25 ), data: data[ "carousel" ]! )
        self.carousel.center.x = self.center.x
        self.addSubview( self.carousel )
        
        for item in carousel.dots {
            item.frame.origin.y = self.frame.height - 50
            self.addSubview( item )
        }
        
        self.closeButton = CloseButton(frame: CGRect( x: header.frame.width - 0, y: header.frame.origin.y + 12, width: 20, height: 20 ) )
        let tapCloseRecognizer = UITapGestureRecognizer( target: self, action: "closeEtiquette:" )
        self.closeButton.addGestureRecognizer( tapCloseRecognizer )
        self.addSubview( self.closeButton )
    }
    
    func closeEtiquette( sender: UITapGestureRecognizer ) {
        self.delegate?.closeActivity()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
