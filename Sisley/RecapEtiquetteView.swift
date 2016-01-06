//
//  RecapEtiquetteView.swift
//  Sisley
//
//  Created by Soufiane Lasri on 06/01/2016.
//  Copyright © 2016 Soufiane Lasri. All rights reserved.
//

import UIKit

class RecapEtiquetteView: UIView {
    init( frame: CGRect, data: [ String : String ] ) {
        super.init( frame: frame )
        
        let header = RecapHeaderView( frame: CGRect( x: 0, y: 0, width: self.frame.width, height: 40 ), text: data[ "title" ]! )
        self.addSubview( header )
        
        let body = RecapEtiquetteBodyView( frame: CGRect( x: 0, y: 40, width: self.frame.width, height: self.frame.height - 42 ), text: data[ "answer" ]! )
        self.addSubview( body )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}