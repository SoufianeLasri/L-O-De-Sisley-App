//
//  ReactionsView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 29/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class ReactionsView: UIView {
    init( frame: CGRect, data: [ [ String : String ] ] ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor( red: 0.98, green: 0.95, blue: 0.91, alpha: 1.0 )
        
        for ( index, item ) in data.enumerate() {
            let etiquetteView = ReactionEtiquetteView( frame: CGRect( x: 0, y: CGFloat( 113 * index ), width: self.frame.width, height: 110 ), flowerImage: item[ "flowerImage" ]!, heartImage: item[ "heartImage" ]!, name: item[ "name" ]!, reaction: item[ "reaction" ]! )
            self.addSubview( etiquetteView )
        }
        
        let bottomView = UIView( frame: CGRect( x: 0, y: CGFloat( 113 * data.count ), width: self.frame.width, height: self.frame.height - 113 * CGFloat( data.count ) ) )
        bottomView.backgroundColor = UIColor.whiteColor()
        self.addSubview( bottomView )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}