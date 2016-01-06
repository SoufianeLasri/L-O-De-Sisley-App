//
//  RecapView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 06/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class RecapView: UIView {
    init( frame: CGRect, text: [ String ] ) {
        super.init( frame: frame )
        
        var items: [ RecapEtiquetteView ] = []
        
        let data = [
            [
                "title": "État",
                "answer": text[ 0 ]
            ],
            [
                "title": "Fatigue",
                "answer": text[ 1 ]
            ],
            [
                "title": "Humeur",
                "answer": text[ 2 ]
            ]
        ]
        
        let stressEtiquette = RecapEtiquetteView( frame: CGRect( x: 25, y: 95, width: 190, height: 95 ), data: data[ 0 ] )
        stressEtiquette.alpha = 0.0
        items.append( stressEtiquette )
        self.addSubview( stressEtiquette )
        
        let tirednessEtiquette = RecapEtiquetteView( frame: CGRect( x: self.frame.width - 215, y: 175, width: 190, height: 95 ), data: data[ 1 ] )
        tirednessEtiquette.alpha = 0.0
        items.append( tirednessEtiquette )
        self.addSubview( tirednessEtiquette )
        
        let moodEtiquette = RecapEtiquetteView( frame: CGRect( x: 25, y: 255, width: 190, height: 95 ), data: data[ 2 ] )
        moodEtiquette.alpha = 0.0
        items.append( moodEtiquette )
        self.addSubview( moodEtiquette )
        
        var delay = 1.5
        for item in items {
            UIView.animateWithDuration( 0.5, delay: delay, options: .TransitionNone, animations: {
                item.alpha = 1.0
                item.frame.origin.y -= 5
            }, completion: { finished in
                UIView.animateWithDuration( 0.5, delay: 1.0, options: .TransitionNone, animations: {
                    item.alpha = 0.0
                    item.frame.origin.y -= 5
                }, completion: nil )
            } )
            delay += 1.25
        }
        
        let chrono = 5.5 * Double( NSEC_PER_SEC )
        let time = dispatch_time( DISPATCH_TIME_NOW, Int64( chrono ) )
        dispatch_after( time, dispatch_get_main_queue() ) {
            self.hidden = true
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
