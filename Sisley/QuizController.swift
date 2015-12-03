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
    
    var questionLabel = UILabel()
    var sliderValueLabel = UILabel()
    var questions: [ String ] = []
    var answers = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.customSlider.delegate = self
        self.view.backgroundColor = UIColor( red: 1, green: 0.98, blue: 0.96, alpha: 1 )
        
        self.questions = [
            "Combien d'années\navez-vous célébrées ?",
            "Quel est votre\nniveau de stress ?",
            "Quel est votre\nniveau de fatigue ?",
            "Comment vous\nsentez vous ?"
        ]
        
        let title = UITitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.78, green: 0.82, blue: 0.85, alpha: 1 ) )
        title.text = "Mon questionnaire"
        title.font = UIFont( name: "Santana", size: 20.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        self.questionLabel = UILabel( frame: CGRect( x: 0, y: 100, width: self.view.frame.width, height: 80 ) )
        self.questionLabel.numberOfLines = 2
        self.questionLabel.font = UIFont( name: "Santana-Bold", size: 23.0 )
        self.questionLabel.textAlignment = .Center
        self.questionLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 )
        self.questionLabel.alpha = 0.0
        
        self.sliderValueLabel = UILabel( frame: CGRect( x: 0, y: 160, width: self.view.frame.width, height: 80 ) )
        self.sliderValueLabel.text = "15"
        self.sliderValueLabel.font = UIFont( name: "Bellota-Regular", size: 45.0 )
        self.sliderValueLabel.textAlignment = .Center
        self.sliderValueLabel.textColor = UIColor( red: 0.9, green: 0.81, blue: 0.47, alpha: 1 )
        self.sliderValueLabel.alpha = 0.0
        
        self.view.addSubview( title )
        self.view.addSubview( self.questionLabel )
        self.view.addSubview( self.sliderValueLabel )

    }
    
    override func viewDidAppear(animated: Bool) {
        nextQuestion()
    }
    
    func nextQuestion() {
        self.questionLabel.text = self.questions[ self.index ]

        UIView.animateWithDuration( 0.2, delay: 0.5, options: UIViewAnimationOptions.TransitionNone, animations: {
            self.questionLabel.alpha = 1.0
            self.sliderValueLabel.alpha = 1.0
        }, completion: { ( finished: Bool ) -> Void in
           // TODO Allow user to drag the slider
        } )
    }
    
    func validateQuestion() {
        UIView.animateWithDuration( 0.2, delay: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: {
            self.questionLabel.alpha = 0.0
            self.sliderValueLabel.alpha = 0.0
            }, completion: { ( finished: Bool ) -> Void in
                self.index++
                self.nextQuestion()
        } )
    }
    
    func getValue( value: Double ) {
        self.sliderValueLabel.text = String( Int( value ) )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

