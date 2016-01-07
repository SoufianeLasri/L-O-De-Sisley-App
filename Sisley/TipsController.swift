//
//  TipsController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 26/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

protocol TipsDelegate : class {
    func launchRegeneration()
}

class TipsController: UIViewController, SliderTipsViewDelegate, ActivityViewDelegate {
    
    var firstActivityView: ActivityView!
    var secondActivityView: ActivityView!
    var thirdActivityView: ActivityView!
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
        
        let firstData = [
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
        
        let secondData = [
            "header": [
                "title": "Notre sélection cocooning"
            ],
            "etiquette": [
                "mainText": "Crème hydratante",
                "secondText": "des fruits secs"
            ],
            "carousel": [
                "packShotView": [
                    "time": "10 min",
                    "image": "packShot.png"
                ],
                "detailsView": [
                    "details": "Un soin compensateur qui apaise les\npeaux agressées.",
                    "tip": "Le magnésium est indispensable pour le bon fonctionnement de nos muscles et influence notre état de fatigue. Une bonne raison d'en faire le plein au quotidien, grâce à ces sources naturelles. Tous les fruits secs oléagineux sont riches en magnésium."
                ],
                "reactionsView": [
                    [
                        "name": "Julie",
                        "reaction": "Ce duo de soin est parfait !",
                        "flowerImage": "comment1.png",
                        "heartImage": "heartFull.png"
                    ],
                    [
                        "name": "Annabelle",
                        "reaction": "Idéal pour grignoter à ma pause café",
                        "flowerImage": "comment2.png",
                        "heartImage": "heartFull.png"
                    ],
                    [
                        "name": "Véronique",
                        "reaction": "Je recommande ce soin,\nun vrai plus pour la peau !",
                        "flowerImage": "comment3.png",
                        "heartImage": "heartFull.png"
                    ]
                ]
            ]
        ]
        
        let thirdData = [
            "header": [
                "title": "Notre sélection à partager"
            ],
            "etiquette": [
                "mainText": "Crème hydratante",
                "secondText": "un sourire à un inconnu"
            ],
            "carousel": [
                "packShotView": [
                    "time": "5 min",
                    "image": "packShot.png"
                ],
                "detailsView": [
                    "details": "Un soin compensateur qui apaise les\npeaux agressées.",
                    "tip": "Dites bonjour et en souriez à des inconnus que vous croisez. Les gens que vous croisez sont exactement comme vous, ils n’aspirent qu’à une chose, être heureux. Sourire à un inconnu vous offre un instant de bonheur."
                ],
                "reactionsView": [
                    [
                        "name": "Gaëlle",
                        "reaction": "Ce duo de soin est parfait !",
                        "flowerImage": "comment1.png",
                        "heartImage": "heartFull.png"
                    ],
                    [
                        "name": "Sophie",
                        "reaction": "En souriant à des inconnus que je croise, je m’offre un instant de bonheur.",
                        "flowerImage": "comment2.png",
                        "heartImage": "heartFull.png"
                    ],
                    [
                        "name": "Emma",
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
        self.customSlider.delegate = self

        self.firstActivityView = ActivityView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ), data: firstData )
        self.firstActivityView.delegate = self
        self.view.addSubview( self.firstActivityView )
        
        self.secondActivityView = ActivityView( frame: CGRect( x: -self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height ), data: secondData )
        self.secondActivityView.delegate = self
        self.view.addSubview( self.secondActivityView )
        
        self.thirdActivityView = ActivityView( frame: CGRect( x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height ), data: thirdData )
        self.thirdActivityView.delegate = self
        self.view.addSubview( self.thirdActivityView )
    }
    
    func validateActivity() {
        self.delegate?.launchRegeneration()
        self.dismissViewControllerAnimated( false, completion: {} )
    }
    
    func getValue( value: Double ) {
        var firstValue = value * 3 + 0.5
        let secondValue = value * 3 - 0.5
        let thirdValue = value * 3 - 1.5
        
        if firstValue > 2.0 {
            firstValue -= 3.0
        }

        self.firstActivityView.frame.origin.x = CGFloat(firstValue) * self.view.frame.width - self.view.frame.width / 2
        self.secondActivityView.frame.origin.x = CGFloat(secondValue) * self.view.frame.width - self.view.frame.width / 2
        self.thirdActivityView.frame.origin.x = CGFloat(thirdValue) * self.view.frame.width - self.view.frame.width / 2
    }
}