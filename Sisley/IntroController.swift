//
//  IntroController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 04/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class IntroController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 )
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        title.text = "Présentation"
        title.font = UIFont( name: "Santana", size: 23.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.view.addSubview( title )
        
        let imageView = UIImageView( frame: CGRect( x: 0, y: 170, width: 105, height: 105 ) )
        imageView.image = UIImage( named: "sisleyLogo.png" )
        imageView.center.x = self.view.center.x
        self.view.addSubview( imageView )
        
        let appName = UILabel( frame: CGRect( x: 0, y: 285, width: self.view.frame.width, height: 40 ) )
        appName.text = "L'O de Sisley"
        appName.font = UIFont( name: "Bellota", size: 25.0 )
        appName.textAlignment = .Center
        appName.textColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        self.view.addSubview( appName )
        
        let welcomeText = UILabel( frame: CGRect( x: 0, y: 390, width: self.view.frame.width, height: 30 ) )
        welcomeText.text = "Bienvenue"
        welcomeText.font = UIFont( name: "Santana-Bold", size: 28.0 )
        welcomeText.textAlignment = .Center
        welcomeText.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 )
        self.view.addSubview( welcomeText )
        
        let subtitleText = UILabel( frame: CGRect( x: 0, y: 420, width: self.view.frame.width, height: 30 ) )
        subtitleText.text = "Vivez la nouvelle expérience Sisley"
        subtitleText.font = UIFont( name: "Bellota-Italic", size: 19.0 )
        subtitleText.textAlignment = .Center
        subtitleText.textColor = UIColor( red: 0.89, green: 0.81, blue: 0.47, alpha: 1.0 )
        self.view.addSubview( subtitleText )
        
        let linePath = UIBezierPath()
        linePath.moveToPoint( CGPoint( x: self.view.frame.width / 2 - 35, y: 475 ) )
        linePath.addLineToPoint( CGPoint( x: self.view.frame.width / 2 + 35, y: 475 ) )
        
        let line = CAShapeLayer()
        line.path = linePath.CGPath
        line.lineWidth = 1.0
        line.lineCap = kCALineJoinRound
        line.strokeColor = UIColor( red: 0.36, green: 0.37, blue: 0.54, alpha: 1.0 ).CGColor
        self.view.layer.addSublayer( line )
        
        let tipDetails = UILabel( frame: CGRect( x: 0, y: 440, width: self.view.frame.width, height: 200 ) )
        tipDetails.text = "L’O de Sisley est une expérience inédite\nqui vous accompagnera jour après jour afin de\nvous apporter des conseils personnalisés pour\naméliorer votre bien-être."
        tipDetails.numberOfLines = 6
        tipDetails.font = UIFont( name: "Bellota-Regular", size: 17.0 )
        tipDetails.textAlignment = .Center
        tipDetails.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        self.view.addSubview( tipDetails )
        
        let nextButton = NextButton( frame: CGRect( x: 0, y: 630, width: 50, height: 50 ) )
        nextButton.center.x = self.view.center.x
        let nextTap = UITapGestureRecognizer( target: self, action: "goToConnexion:" )
        nextButton.addGestureRecognizer( nextTap )
        self.view.addSubview( nextButton )
        
        self.navigationController?.navigationBarHidden = true
    }
    
    func goToConnexion( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            performSegueWithIdentifier( "goToConnexion", sender: nil )
        }
    }
}