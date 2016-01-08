//
//  CustomScrollView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 08/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

protocol CustomScrollViewDelegate: class {
    func toggleButtons( index: Int )
}

class CustomScrollView: UIScrollView {
    
    var creme: HistoryEtiquetteView!
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.showsVerticalScrollIndicator = false
        self.bounces = false
        
        let firstHeader = HistoryHeaderView( frame: CGRect( x: 0, y: 15, width: self.frame.width - 60, height: 40 ), data: "Notre sélection cocooning" )
        firstHeader.center.x = self.center.x
        self.addSubview( firstHeader )
        
        self.creme = HistoryEtiquetteView( frame: CGRect( x: 0, y: firstHeader.frame.maxY, width: self.frame.width - 60, height: 120 ), mainText: "Crème hydratante", secondText: "+ un thé gourmand" )
        self.creme.center.x = self.center.x
        self.addSubview( self.creme )
        
        let eau = HistoryEtiquetteView( frame: CGRect( x: 0, y: self.creme.frame.maxY + 3, width: self.frame.width - 60, height: 120 ), mainText: "Eau florale", secondText: "+ yoga" )
        eau.center.x = self.center.x
        self.addSubview( eau )
        
        let secondHeader = HistoryHeaderView( frame: CGRect( x: 0, y: eau.frame.maxY + 10, width: self.frame.width - 60, height: 40 ), data: "Notre sélection découverte" )
        secondHeader.center.x = self.center.x
        self.addSubview( secondHeader )
        
        let lotion = HistoryEtiquetteView( frame: CGRect( x: 0, y: secondHeader.frame.maxY, width: self.frame.width - 60, height: 120 ), mainText: "Lotion pamplemousse", secondText: "+ un cocktail aux légumes" )
        lotion.center.x = self.center.x
        self.addSubview( lotion )
        
        let masque = HistoryEtiquetteView( frame: CGRect( x: 0, y: lotion.frame.maxY + 3, width: self.frame.width - 60, height: 120 ), mainText: "Masque givre au tilleul", secondText: "+ recette de grand-mère" )
        masque.center.x = self.center.x
        self.addSubview( masque )
        
        self.contentSize = CGSize( width: self.frame.width, height: masque.frame.maxY )

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
