//
//  QuizController.swift
//  Sisley
//
//  Created by BOULAY Jeremie on 03/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class QuizController: UIViewController, CustomSliderViewDelegate {
    
    @IBOutlet weak var customSlider: CustomSliderView!
    
    var sliderValueLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor( red: 1, green: 0.98, blue: 0.96, alpha: 1 )
        
        let title = UITitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.78, green: 0.82, blue: 0.85, alpha: 1 ) )
        title.text = "Mon questionnaire"
        title.font = UIFont( name: "Santana", size: 20.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        let question = UILabel( frame: CGRect( x: 0, y: 100, width: self.view.frame.width, height: 80 ) )
        question.text = "Combien d'années\navez-vous célébrées ?"
        question.numberOfLines = 2
        question.font = UIFont( name: "Santana-Bold", size: 23.0 )
        question.textAlignment = .Center
        question.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 )
        
        self.customSlider.delegate = self
        
        self.sliderValueLabel = UILabel( frame: CGRect( x: 0, y: 160, width: self.view.frame.width, height: 80 ) )
        self.sliderValueLabel.text = "15"
        self.sliderValueLabel.font = UIFont( name: "Bellota-Regular", size: 45.0 )
        self.sliderValueLabel.textAlignment = .Center
        self.sliderValueLabel.textColor = UIColor( red: 0.9, green: 0.81, blue: 0.47, alpha: 1 )
        
        self.view.addSubview( title )
        self.view.addSubview( question )
        self.view.addSubview( self.sliderValueLabel )
    }
    
    func getValue( value: Double ) {
        self.sliderValueLabel.text = String( Int( value ) )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

