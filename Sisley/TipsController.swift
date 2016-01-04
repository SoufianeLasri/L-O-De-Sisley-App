//
//  TipsController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 26/12/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class TipsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor( red: 0.98, green: 0.95, blue: 0.91, alpha: 1.0 )
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        title.text = "Mes conseils Sisley"
        title.font = UIFont( name: "Santana", size: 23.0 )
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
        
        let activityView = ActivityView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ), data: data )
        self.view.addSubview( activityView )
    }
}