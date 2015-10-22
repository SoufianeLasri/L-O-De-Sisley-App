//
//  ViewController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 23/10/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel( frame: CGRectMake( self.view.frame.width / 2 - 60, self.view.frame.height / 2, 120, 21 ) )
        label.text = "Hello Jeremie"
        label.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview( label )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

