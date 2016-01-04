//
//  ConnexionView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class ConnexionView: UIView {
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        title.text = "Connexion"
        title.font = UIFont( name: "Santana", size: 23.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.addSubview( title )

        let mailLabel = UILabel( frame: CGRect( x: 60, y: 365, width: self.frame.width, height: 30 ) )
        mailLabel.text = "soufiane.lasri@gmail.com"
        mailLabel.font = UIFont( name: "Bellota-Regular", size: 19.0 )
        mailLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.addSubview( mailLabel )
        
        let firstLinePath = UIBezierPath()
        firstLinePath.moveToPoint( CGPoint( x: 60, y: 400 ) )
        firstLinePath.addLineToPoint( CGPoint( x: self.frame.width - 60, y: 400 ) )
        
        let firstLine = CAShapeLayer()
        firstLine.path = firstLinePath.CGPath
        firstLine.lineWidth = 1.0
        firstLine.lineCap = kCALineJoinRound
        firstLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 ).CGColor
        self.layer.addSublayer( firstLine )
        
        let passwordLabel = UILabel( frame: CGRect( x: 60, y: 425, width: self.frame.width, height: 30 ) )
        passwordLabel.text = "·········"
        passwordLabel.font = UIFont( name: "Bellota-Bold", size: 29.0 )
        passwordLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.addSubview( passwordLabel )
        
        let secondLinePath = UIBezierPath()
        secondLinePath.moveToPoint( CGPoint( x: 60, y: 460 ) )
        secondLinePath.addLineToPoint( CGPoint( x: self.frame.width - 60, y: 460 ) )
        
        let secondLine = CAShapeLayer()
        secondLine.path = secondLinePath.CGPath
        secondLine.lineWidth = 1.0
        secondLine.lineCap = kCALineJoinRound
        secondLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 ).CGColor
        self.layer.addSublayer( secondLine )
        
        let facebookConnectButton = SharingButton( frame: CGRect( x: 0, y: 490, width: 50, height: 50 ), imageName: "facebook.png"  )
        facebookConnectButton.alpha = 1.0
        facebookConnectButton.center = CGPoint( x: self.center.x - 40, y: 520 )
        self.addSubview( facebookConnectButton )
        
        let validateButton = ValidateButton( frame: CGRect( x: 0, y: 490, width: 50, height: 50 ) )
        validateButton.center = CGPoint( x: self.center.x + 40, y: 520 )
        self.addSubview( validateButton )
        
        let passwordForgottenLabel = UILabel( frame: CGRect( x: 0, y: self.frame.height - 90, width: self.frame.width, height: 40 ) )
        passwordForgottenLabel.text = "Mot de passe oublié ?"
        passwordForgottenLabel.numberOfLines = 2
        passwordForgottenLabel.textAlignment = .Center
        passwordForgottenLabel.font = UIFont( name: "Bellota-Bold", size: 16.0 )
        passwordForgottenLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 )
        var underlineAttribute = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue ]
        var underlineAttributedString = NSAttributedString( string: passwordForgottenLabel.text!, attributes: underlineAttribute )
        passwordForgottenLabel.attributedText = underlineAttributedString
        passwordForgottenLabel.alpha = 0.6
        self.addSubview( passwordForgottenLabel )
        
        let createAccountLabel = UILabel( frame: CGRect( x: 0, y: self.frame.height - 60, width: self.frame.width, height: 40 ) )
        createAccountLabel.text = "Se créer un compte"
        createAccountLabel.numberOfLines = 2
        createAccountLabel.textAlignment = .Center
        createAccountLabel.font = UIFont( name: "Bellota-Bold", size: 16.0 )
        createAccountLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 )
        underlineAttribute = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue ]
        underlineAttributedString = NSAttributedString( string: createAccountLabel.text!, attributes: underlineAttribute )
        createAccountLabel.attributedText = underlineAttributedString
        createAccountLabel.alpha = 0.6
        self.addSubview( createAccountLabel )
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}