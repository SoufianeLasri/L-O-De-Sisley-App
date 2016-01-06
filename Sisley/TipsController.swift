//
//  TipsController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 26/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

protocol TipsDelegate : class {

}

class TipsController: UIViewController {
    
    var customSlider: SliderTipsView!
    var delegate: TipsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clearColor()
        self.view.opaque = true
        
        let backgroundView = UIView( frame: self.view.frame )
        backgroundView.backgroundColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 )
        self.view.addSubview( backgroundView )
        
        let viewPath = UIBezierPath( rect: self.view.frame )
        let circlePath = UIBezierPath( ovalInRect: CGRect( x: 40, y: self.view.frame.height / 2 - 27, width: self.view.frame.width - 80, height: self.view.frame.width - 80 ) )
        viewPath.usesEvenOddFillRule = true
        viewPath.appendPath( circlePath )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = viewPath.CGPath
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.fillColor = UIColor.whiteColor().CGColor
        
        backgroundView.layer.mask = maskLayer
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        title.text = "Mes conseils Sisley"
        title.font = UIFont( name: "Santana", size: 20.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.view.addSubview( title )
        
        let data = [
            "header": [
                "title": "Notre sélection cocooning"
            ],
            "etiquette": [
                "mainText": "Crème hydratante",
                "secondText": "un thé gourmand"
            ],
            "carousel": [
                "packShotView": [
                    "time": "20 min",
                    "image": "packShot.png"
                ],
                "detailsView": [
                    "details": "Un soin compensateur qui apaise les\npeaux agressées.",
                    "tip": "Là où une overdose de café peut\nentrainer nervosité et état d'excitation, le\nthé détend. Quelques tasses par jour\npermettent de relâcher la pression. Après\ncinq tasses de thé, le risque de souffrir de\nstress diminue de 20%."
                ],
                "reactionsView": [
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
                        "heartImage": "heartFull.png"
                    ]
                ]
            ]
        ]
        
        self.customSlider = SliderTipsView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width * 0.9, height: self.view.frame.width * 0.9 ) )
        self.customSlider.center.x = self.view.center.x
        self.customSlider.center.y = self.view.center.y + 120
        self.view.addSubview( self.customSlider )
//        self.customSlider.delegate = self

        let activityView = ActivityView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ), data: data )
        self.view.addSubview( activityView )
    }
}