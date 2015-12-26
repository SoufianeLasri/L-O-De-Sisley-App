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
        
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 ) )
        title.text = "Mes conseils Sisley"
        title.font = UIFont( name: "Santana", size: 23.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        self.view.backgroundColor = UIColor( red: 0.98, green: 0.95, blue: 0.91, alpha: 1.0 )
        
        self.view.addSubview( title )
        
        let header = HeaderView( frame: CGRect( x: 0, y: 100, width: self.view.frame.width - 60, height: 50 ), text: "Notre sélection cocooning" )
        header.center.x = self.view.center.x
        self.view.addSubview( header )
        
        let etiquette = EtiquetteView( frame: CGRect( x: 0, y: 150, width: self.view.frame.width - 60, height: 150 ), mainText: "Crème hydratante", secondText: "un thé gourmand" )
        etiquette.center.x = self.view.center.x
        self.view.addSubview( etiquette )
    }
}