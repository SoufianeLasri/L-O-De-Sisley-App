//
//  IntroController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class IntroController: UIViewController {
    
    var customTitle: CustomTitle!
    var imageView: UIImageView!
    var appName: UILabel!
    var welcomeText: UILabel!
    var subtitleText: UILabel!
    var line: CAShapeLayer!
    var tipDetails: UILabel!
    var nextButton: NextButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 )
        
        self.customTitle = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        self.customTitle.text = "Présentation"
        self.customTitle.font = UIFont( name: "Santana", size: 20.0 )
        self.customTitle.textAlignment = .Center
        self.customTitle.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.customTitle.alpha = 0.0
        self.view.addSubview( self.customTitle )
        
        self.imageView = UIImageView( frame: CGRect( x: 0, y: 250, width: 97, height: 97 ) )
        self.imageView.image = UIImage( named: "sisleyLogo.png" )
        self.imageView.center.x = self.view.center.x
        self.view.addSubview( self.imageView )
        
        self.appName = UILabel( frame: CGRect( x: 0, y: 357, width: self.view.frame.width, height: 40 ) )
        self.appName.text = "L'O de Sisley"
        self.appName.font = UIFont( name: "Bellota", size: 27.0 )
        self.appName.textAlignment = .Center
        self.appName.textColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        self.view.addSubview( self.appName )
        
        self.welcomeText = UILabel( frame: CGRect( x: 0, y: 355, width: self.view.frame.width, height: 30 ) )
        self.welcomeText.text = "Bienvenue"
        self.welcomeText.font = UIFont( name: "Santana-Bold", size: 26.0 )
        self.welcomeText.textAlignment = .Center
        self.welcomeText.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.welcomeText.alpha = 0.0
        self.view.addSubview( self.welcomeText )
        
        self.subtitleText = UILabel( frame: CGRect( x: 0, y: 380, width: self.view.frame.width, height: 30 ) )
        self.subtitleText.text = "Vivez la nouvelle expérience Sisley"
        self.subtitleText.font = UIFont( name: "Bellota-Italic", size: 18.0 )
        self.subtitleText.textAlignment = .Center
        self.subtitleText.textColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        self.subtitleText.alpha = 0.0
        self.view.addSubview( self.subtitleText )
        
        let linePath = UIBezierPath()
        linePath.moveToPoint( CGPoint( x: self.view.frame.width / 2 - 35, y: 430 ) )
        linePath.addLineToPoint( CGPoint( x: self.view.frame.width / 2 + 35, y: 430 ) )
        
        self.line = CAShapeLayer()
        self.line.path = linePath.CGPath
        self.line.lineWidth = 1.0
        self.line.lineCap = kCALineJoinRound
        self.line.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 ).CGColor
        self.line.opacity = 0.0
        self.view.layer.addSublayer( self.line )
        
        self.tipDetails = UILabel( frame: CGRect( x: 0, y: 435, width: self.view.frame.width, height: 110 ) )
        self.tipDetails.text = "L’O de Sisley est une expérience inédite\nqui vous accompagnera jour après jour afin de\nvous apporter des conseils personnalisés pour\naméliorer votre bien-être."
        self.tipDetails.numberOfLines = 6
        self.tipDetails.font = UIFont( name: "Bellota-Regular", size: 15.0 )
        self.tipDetails.textAlignment = .Center
        self.tipDetails.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.tipDetails.alpha = 0.0
        self.view.addSubview( self.tipDetails )
        
        self.nextButton = NextButton( frame: CGRect( x: 0, y: 575, width: 50, height: 50 ) )
        self.nextButton.center.x = self.view.center.x
        let nextTap = UITapGestureRecognizer( target: self, action: "goToConnexion:" )
        self.nextButton.addGestureRecognizer( nextTap )
        self.nextButton.alpha = 0.0
        self.view.addSubview( self.nextButton )
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration( 0.5, delay: 0.5, options: .TransitionNone, animations: {
            self.imageView.frame.origin.y = 155
            self.appName.frame.origin.y = 260
        }, completion: { finished in
            UIView.animateWithDuration( 0.5, animations: {
                self.customTitle.alpha = 1.0
                self.welcomeText.alpha = 1.0
                self.subtitleText.alpha = 1.0
                self.line.opacity = 1.0
                self.tipDetails.alpha = 1.0
            } )
        } )
        
        UIView.animateWithDuration( 0.5, delay: 1.5, options: .TransitionNone, animations: {
            self.nextButton.alpha = 1.0
            self.nextButton.frame.origin.y -= 5
        }, completion: nil )
    }
    
    func goToConnexion( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            UIView.animateWithDuration( 0.5, delay: 0.0, options: .TransitionNone, animations: {
                self.customTitle.alpha = 0.0
                self.welcomeText.alpha = 0.0
                self.subtitleText.alpha = 0.0
                self.line.opacity = 0.0
                self.tipDetails.alpha = 0.0
            }, completion: { finished in
                self.performSegueWithIdentifier( "goToConnexion", sender: nil )
            } )
        }
    }
}