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
    var webView: CustomWebViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ) )
        title.text = "Mon orchidée"
        title.font = UIFont( name: "Santana", size: 23.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        let navigationButton = NavigationView( frame: self.view.frame )
        
        self.webView = CustomWebViewController( frame: self.view.frame )
        
        self.view.addSubview( self.webView! )
        self.view.addSubview( title )
        self.view.addSubview( navigationButton )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

