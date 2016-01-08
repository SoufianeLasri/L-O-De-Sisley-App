//
//  ConnexionView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class ConnexionController: UIViewController {
    
    var customTitle: CustomTitle!
    var imageView: UIImageView!
    var appName: UILabel!
    var mailLabel: UILabel!
    var firstLine: CAShapeLayer!
    var passwordLabel: UILabel!
    var secondLine: CAShapeLayer!
    var facebookConnectButton: SharingButton!
    var validateButton: ValidateButton!
    var passwordForgottenLabel: UILabel!
    var createAccountLabel: UILabel!
    var opacityLineAnimation: CABasicAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 )
        
        self.customTitle = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        self.customTitle.text = "Connexion"
        self.customTitle.font = UIFont( name: "Santana", size: 20.0 )
        self.customTitle.textAlignment = .Center
        self.customTitle.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.view.addSubview( self.customTitle )
        
        self.imageView = UIImageView( frame: CGRect( x: 0, y: 155, width: 97, height: 97 ) )
        self.imageView.image = UIImage( named: "sisleyLogo.png" )
        self.imageView.center.x = self.view.center.x
        self.view.addSubview( self.imageView )
        
        self.appName = UILabel( frame: CGRect( x: 0, y: 260, width: self.view.frame.width, height: 40 ) )
        self.appName.text = "L'O de Sisley"
        self.appName.font = UIFont( name: "Bellota", size: 27.0 )
        self.appName.textAlignment = .Center
        self.appName.textColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        self.view.addSubview( self.appName )

        self.mailLabel = UILabel( frame: CGRect( x: 60, y: 330, width: self.view.frame.width, height: 30 ) )
        self.mailLabel.text = "soufiane.lasri@gmail.com"
        self.mailLabel.font = UIFont( name: "Bellota-Regular", size: 16.0 )
        self.mailLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.view.addSubview( self.mailLabel )
        
        let firstLinePath = UIBezierPath()
        firstLinePath.moveToPoint( CGPoint( x: 60, y: 370 ) )
        firstLinePath.addLineToPoint( CGPoint( x: self.view.frame.width - 60, y: 370 ) )
        
        self.firstLine = CAShapeLayer()
        self.firstLine.path = firstLinePath.CGPath
        self.firstLine.lineWidth = 1.0
        self.firstLine.lineCap = kCALineJoinRound
        self.firstLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 0.0 ).CGColor
        self.view.layer.addSublayer( self.firstLine )
        
        self.passwordLabel = UILabel( frame: CGRect( x: 60, y: 385, width: self.view.frame.width, height: 30 ) )
        self.passwordLabel.text = "·········"
        self.passwordLabel.font = UIFont( name: "Bellota-Bold", size: 27.0 )
        self.passwordLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.view.addSubview( self.passwordLabel )
        
        let secondLinePath = UIBezierPath()
        secondLinePath.moveToPoint( CGPoint( x: 60, y: 420 ) )
        secondLinePath.addLineToPoint( CGPoint( x: self.view.frame.width - 60, y: 420 ) )
        
        self.secondLine = CAShapeLayer()
        self.secondLine.path = secondLinePath.CGPath
        self.secondLine.lineWidth = 1.0
        self.secondLine.lineCap = kCALineJoinRound
        self.secondLine.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 0.0 ).CGColor
        self.view.layer.addSublayer( self.secondLine )
        
        self.facebookConnectButton = SharingButton( frame: CGRect( x: 0, y: 0, width: 50, height: 50 ), imageName: "facebook.png"  )
        self.facebookConnectButton.alpha = 1.0
        self.facebookConnectButton.center = CGPoint( x: self.view.center.x - 40, y: 480 )
        self.view.addSubview( self.facebookConnectButton )
        
        self.validateButton = ValidateButton( frame: CGRect( x: 0, y: 0, width: 50, height: 50 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 ) )
        self.validateButton.center = CGPoint( x: self.view.center.x + 40, y: 480 )
        let validateTap = UITapGestureRecognizer( target: self, action: "goToFlower:" )
        self.validateButton.addGestureRecognizer( validateTap )
        self.view.addSubview( self.validateButton )
        
        self.passwordForgottenLabel = UILabel( frame: CGRect( x: 0, y: self.view.frame.height - 90, width: self.view.frame.width, height: 40 ) )
        self.passwordForgottenLabel.text = "Mot de passe oublié ?"
        self.passwordForgottenLabel.numberOfLines = 2
        self.passwordForgottenLabel.textAlignment = .Center
        self.passwordForgottenLabel.font = UIFont( name: "Bellota-Bold", size: 15.0 )
        self.passwordForgottenLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 )
        var underlineAttribute = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue ]
        var underlineAttributedString = NSAttributedString( string: self.passwordForgottenLabel.text!, attributes: underlineAttribute )
        self.passwordForgottenLabel.attributedText = underlineAttributedString
        self.passwordForgottenLabel.alpha = 0.6
        self.view.addSubview( self.passwordForgottenLabel )
        
        self.createAccountLabel = UILabel( frame: CGRect( x: 0, y: self.view.frame.height - 60, width: self.view.frame.width, height: 40 ) )
        self.createAccountLabel.text = "Se créer un compte"
        self.createAccountLabel.numberOfLines = 2
        self.createAccountLabel.textAlignment = .Center
        self.createAccountLabel.font = UIFont( name: "Bellota-Bold", size: 15.0 )
        self.createAccountLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 )
        underlineAttribute = [ NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue ]
        underlineAttributedString = NSAttributedString( string: self.createAccountLabel.text!, attributes: underlineAttribute )
        self.createAccountLabel.attributedText = underlineAttributedString
        self.createAccountLabel.alpha = 0.6
        self.view.addSubview( self.createAccountLabel )
        
        self.opacityLineAnimation                     = CABasicAnimation( keyPath: "strokeColor" )
        self.opacityLineAnimation.fromValue           = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 0.0 ).CGColor
        self.opacityLineAnimation.toValue             = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 ).CGColor
        self.opacityLineAnimation.duration            = 0.5
        self.opacityLineAnimation.repeatCount         = 0
        self.opacityLineAnimation.removedOnCompletion = false
        self.opacityLineAnimation.fillMode            = kCAFillModeBoth
        
        self.customTitle.alpha = 0.0
        self.mailLabel.alpha = 0.0
        self.passwordLabel.alpha = 0.0
        self.facebookConnectButton.alpha = 0.0
        self.validateButton.alpha = 0.0
        self.passwordForgottenLabel.alpha = 0.0
        self.createAccountLabel.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let chrono = 0.3 * Double( NSEC_PER_SEC )
        let time = dispatch_time( DISPATCH_TIME_NOW, Int64( chrono ) )
        dispatch_after( time, dispatch_get_main_queue() ) {
            self.firstLine.addAnimation( self.opacityLineAnimation, forKey: "strokeColor" )
            self.secondLine.addAnimation( self.opacityLineAnimation, forKey: "strokeColor" )
        }
        
        UIView.animateWithDuration( 0.5, delay: 0.5, options: .TransitionNone, animations: {
            self.customTitle.alpha = 1.0
            self.imageView.alpha = 1.0
            self.appName.alpha = 1.0
            self.mailLabel.alpha = 1.0
            self.passwordLabel.alpha = 1.0
            self.facebookConnectButton.alpha = 1.0
            self.facebookConnectButton.frame.origin.y -= 5.0
            self.validateButton.alpha = 1.0
            self.validateButton.frame.origin.y -= 5.0
            self.passwordForgottenLabel.alpha = 1.0
            self.createAccountLabel.alpha = 1.0
        }, completion: nil )
    }
    
    func goToFlower( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            UIView.animateWithDuration( 0.5, delay: 0.0, options: .TransitionNone, animations: {
                self.customTitle.alpha = 0.0
                self.imageView.alpha = 0.0
                self.appName.alpha = 0.0
                self.mailLabel.alpha = 0.0
                self.firstLine.opacity = 0.0
                self.passwordLabel.alpha = 0.0
                self.secondLine.opacity = 0.0
                self.facebookConnectButton.alpha = 0.0
                self.validateButton.alpha = 0.0
                self.passwordForgottenLabel.alpha = 0.0
                self.createAccountLabel.alpha = 0.0
            }, completion: { finished in
                let storyboard: UIStoryboard = UIStoryboard( name: "Flower", bundle: nil )
                let vc = storyboard.instantiateViewControllerWithIdentifier( "FlowerPage" ) as! FlowerController
                self.navigationController?.pushViewController(vc, animated: false)
//                self.presentViewController( vc, animated: false, completion: nil )
            } )
        }
    }
}