//
//  HistoryEtiquetteView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 07/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//
import UIKit

class HistoryEtiquetteView: UIView {
    
    var title: UILabel!
    var subtitle: UILabel!
    var likeButton: UIImageView!
    
    init( frame: CGRect, mainText: String, secondText: String ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor.whiteColor()
        
        self.title = UILabel( frame: CGRect( x: 0, y: self.frame.height / 2 - 40, width: self.frame.width, height: 50 ) )
        self.title.text = mainText
        self.title.font = UIFont( name: "Santana-Bold", size: 26.0 )
        self.title.textAlignment = .Center
        self.title.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.addSubview( self.title )
        
        self.subtitle = UILabel( frame: CGRect( x: 0, y: self.frame.height / 2 - 12, width: self.frame.width, height: 50 ) )
        self.subtitle.text = secondText
        self.subtitle.font = UIFont( name: "Bellota-Italic", size: 17.0 )
        self.subtitle.textAlignment = .Center
        self.subtitle.textColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        self.addSubview( self.subtitle )
        
        self.likeButton = UIImageView( frame: CGRect( x: self.frame.width - 35, y: 15, width: 22, height: 22 ) )
        self.likeButton.image = UIImage( named: "heartFull.png" )
        self.addSubview( self.likeButton )
    }
    
    func toggleHeart( state: String ) {
        if state == "true" {
            self.likeButton.image = UIImage( named: "heartFull.png" )
        } else {
            self.likeButton.image = UIImage( named: "heartEmpty.png" )
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
