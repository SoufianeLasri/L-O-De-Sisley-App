//
//  HistoryActivityView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 07/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class HistoryActivityView: UIView {
    
    var header: HistoryHeaderView!
    var etiquette: HistoryEtiquetteView!
    
    init( frame: CGRect, data: [ String : String ] ) {
        super.init( frame: frame )
        
        self.header = HistoryHeaderView( frame: CGRect( x: 0, y: 95, width: self.frame.width - 60, height: 40 ), data: data[ "header" ]! )
        header.center.x = self.center.x
        self.addSubview( self.header )
        
        self.etiquette = HistoryEtiquetteView( frame: CGRect( x: 0, y: header.frame.maxY, width: self.frame.width - 60, height: 120 ), mainText: data[ "mainText" ]!, secondText: data[ "secondText" ]! )
        etiquette.center.x = self.center.x
        self.addSubview( self.etiquette )

        self.frame.size.height = 260
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
