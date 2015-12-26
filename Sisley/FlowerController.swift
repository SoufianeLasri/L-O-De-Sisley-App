//
//  FlowerController.swift
//  Sisley
//
//  Created by BOULAY Jeremie on 06/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class FlowerController: UIViewController {
    
    //TODO  : charger le menu ou le quizz
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ) )
        title.text = "Mon orchidée"
        title.font = UIFont( name: "Santana", size: 23.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        let navigationView = NavigationView( frame: self.view.frame )
        let navigationMenuButton = NavigationMenuButton( frame: CGRect( x: 15, y: self.view.frame.height - 75, width: 60, height: 60 ), menuView: navigationView )
        
        let sharingView = SharingView( frame: self.view.frame )
        let sharingMenuButton = SharingMenuButton( frame: CGRect( x: self.view.frame.width - 75, y: self.view.frame.height - 75, width: 60, height: 60 ), menuView: sharingView )
        
        let webView = CustomWebViewController( frame: self.view.frame )
        
        self.view.addSubview( webView )
        self.view.addSubview( title )
        
        self.view.addSubview( sharingMenuButton )
        self.view.addSubview( navigationView )
        self.view.addSubview( navigationMenuButton )
        self.view.addSubview( sharingView )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}