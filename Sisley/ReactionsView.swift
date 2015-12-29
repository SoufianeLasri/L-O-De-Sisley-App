//
//  ReactionsView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 29/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class ReactionsView: UIView {
    
    var params: [ [ String : String ] ]!
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.params = [
            [
                "name": "Joséphine",
                "reaction": "Ce duo de soin est parfait !",
                "flowerImage": "comment1.png",
                "heartImage": "heartFull.png"
            ],
            [
                "name": "Marie",
                "reaction": "Idéal pour se détendre\ndevant un film",
                "flowerImage": "comment2.png",
                "heartImage": "heartFull.png"
            ],
            [
                "name": "Béatrice",
                "reaction": "Je recommande ce soin,\nun vrai plus pour la peau !",
                "flowerImage": "comment3.png",
                "heartImage": "heartEmpty.png"
            ]
        ]
        
        self.backgroundColor = UIColor( red: 0.98, green: 0.95, blue: 0.91, alpha: 1.0 )
        
        for ( index, item ) in self.params.enumerate() {
            let etiquetteView = ReactionEtiquetteView( frame: CGRect( x: 0, y: CGFloat( 113 * index ), width: self.frame.width, height: 110 ), flowerImage: item[ "flowerImage" ]!, heartImage: item[ "heartImage" ]!, name: item[ "name" ]!, reaction: item[ "reaction" ]! )
            self.addSubview( etiquetteView )
        }
        
        let bottomView = UIView( frame: CGRect( x: 0, y: CGFloat( 113 * self.params.count ), width: self.frame.width, height: self.frame.height - 113 * CGFloat( self.params.count ) ) )
        bottomView.backgroundColor = UIColor.whiteColor()
        self.addSubview( bottomView )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}