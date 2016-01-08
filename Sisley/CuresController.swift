//
//  CuresController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 08/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class CuresController: UIViewController, NavigationViewDelegate, CuresActivityDelegate {
    
    var titleLabel: CustomTitle!
    var navigationMenuButton: NavigationMenuButton!
    var navigationView: NavigationView!
    var scrollView: CustomScrollView!
    var activityView: CuresActivityView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 )
        
        self.titleLabel = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1.0 ) )
        self.titleLabel.text = "Mes soins Sisley"
        self.titleLabel.font = UIFont( name: "Santana", size: 20.0 )
        self.titleLabel.textAlignment = .Center
        self.titleLabel.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1.0 )
        self.view.addSubview( self.titleLabel )
        
        self.scrollView = CustomScrollView( frame: CGRect( x: 0, y: 90, width: self.view.frame.width, height: self.view.frame.height - 180 ) )
        self.view.addSubview( self.scrollView )
        
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
        
        self.activityView = CuresActivityView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ), data: data )
        self.activityView.frame.origin.x = self.view.frame.width
        self.activityView.delegate = self
        self.view.addSubview( self.activityView )
        
        let firstActivityTap = UITapGestureRecognizer( target: self, action: "firstActivityTap:" )
        scrollView.creme.addGestureRecognizer( firstActivityTap )
        
        self.navigationView = NavigationView( frame: self.view.frame )
        self.navigationView.delegate = self
        self.navigationMenuButton = NavigationMenuButton( frame: CGRect( x: 25, y: self.view.frame.height + 70, width: 50, height: 50 ), menuView: self.navigationView )
        self.view.addSubview( self.navigationView )
        self.view.addSubview( self.navigationMenuButton )
        
        self.titleLabel.alpha = 0.0
        self.scrollView.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration( 0.5, animations: {
            self.hideUserInterface( false )
        } )
    }
    
    func hideUserInterface( state: Bool ) {
        if state == true {
            self.titleLabel.alpha = 0.0
            self.scrollView.alpha = 0.0
            self.activityView.alpha = 0.0
            self.navigationMenuButton.frame.origin.y = self.view.frame.height + 70
        } else {
            self.titleLabel.alpha = 1.0
            self.scrollView.alpha = 1.0
            self.activityView.alpha = 1.0
            self.navigationMenuButton.frame.origin.y = self.view.frame.height - 70
        }
    }
    
    func firstActivityTap( sender: UITapGestureRecognizer ) {
        UIView.animateWithDuration( 0.5, animations: {
            self.scrollView.frame.origin.x -= self.view.frame.width
            self.navigationMenuButton.frame.origin.x -= self.view.frame.width
            self.activityView.frame.origin.x = 0
        } )
    }
    
    func closeActivity() {
        UIView.animateWithDuration( 0.5, animations: {
            self.scrollView.frame.origin.x += self.view.frame.width
            self.navigationMenuButton.frame.origin.x += self.view.frame.width
            self.activityView.frame.origin.x = self.view.frame.width
        } )
    }
    
    func navigationButtonTapped( type: String ) {
        if type == "flower" {
            UIView.animateWithDuration( 0.5, animations: {
                self.navigationView.alpha = 0.0
                self.hideUserInterface( true )
            }, completion: { finished in
                let storyboard: UIStoryboard = UIStoryboard( name: "Flower", bundle: nil )
                let vc = storyboard.instantiateViewControllerWithIdentifier( "FlowerPage" ) as! FlowerController
                self.navigationController?.pushViewController(vc, animated: false)
//              self.presentViewController( vc, animated: false, completion: nil )
            } )
        }
        
        if type == "history" {
            UIView.animateWithDuration( 0.5, animations: {
                self.navigationView.alpha = 0.0
                self.hideUserInterface( true )
            }, completion: { finished in
                let storyboard: UIStoryboard = UIStoryboard( name: "History", bundle: nil )
                let vc = storyboard.instantiateViewControllerWithIdentifier( "HistoryPage" ) as! HistoryController
                self.navigationController?.pushViewController(vc, animated: false)
//              self.presentViewController( vc, animated: false, completion: nil )
            } )
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
