//
//  TutorialView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 05/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class TutorialView: UIView {
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.backgroundColor = UIColor( red: 0.06, green: 0.08, blue: 0.32, alpha: 0.7 )
        
        let panToChangeImageView = UIImageView( frame: CGRect( x: 0, y: 155, width: 50, height: 50 ) )
        panToChangeImageView.image = UIImage( named: "tutoFirst.png" )
        panToChangeImageView.center.x = self.center.x
        self.addSubview( panToChangeImageView )
        
        let panToChangeLabel = UILabel( frame: CGRect( x: 0, y: 205, width: self.frame.width, height: 60 ) )
        panToChangeLabel.text = "Sélectionnez ta réponse en\ndéplaçant le pointeur"
        panToChangeLabel.numberOfLines = 2
        panToChangeLabel.font = UIFont( name: "Bellota-Bold", size: 15.0 )
        panToChangeLabel.textAlignment = .Center
        panToChangeLabel.textColor = UIColor.whiteColor()
        self.addSubview( panToChangeLabel )
        
        let tapToValidateImageView = UIImageView( frame: CGRect( x: 0, y: 405, width: 50, height: 50 ) )
        tapToValidateImageView.image = UIImage( named: "tutoSecond.png" )
        tapToValidateImageView.center.x = self.center.x
        self.addSubview( tapToValidateImageView )
        
        let tapToValidateLabel = UILabel( frame: CGRect( x: 0, y: 455, width: self.frame.width, height: 60 ) )
        tapToValidateLabel.text = "Touchez votre orchidée pour\nvalider votre réponse"
        tapToValidateLabel.numberOfLines = 2
        tapToValidateLabel.font = UIFont( name: "Bellota-Bold", size: 15.0 )
        tapToValidateLabel.textAlignment = .Center
        tapToValidateLabel.textColor = UIColor.whiteColor()
        self.addSubview( tapToValidateLabel )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
