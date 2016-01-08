//
//  QuizController.swift
//  Sisley
//
//  Created by BOULAY Jeremie on 03/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit


protocol QuizDelegate: class {
    func flowerProgress()
    func buildFlowerWithParams( data: [ CGFloat ], text: [ String ] )
}

class QuizController: UIViewController, CustomSliderViewDelegate {
    
    var customSlider: CustomSliderView!
    var tutorialView: TutorialView!
    var questionLabel: UILabel!
    var sliderValueLabel: UILabel!
    var sliderValueDouble: CGFloat!
    var questions: Array<Dictionary<String, Any>> = []
    var answers: [ CGFloat ] = []
    var selectedAnswersText: [ String ] = []
    var index = 0
    var delegate: QuizDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clearColor()
        self.view.opaque = false
        
        let backgroundView = UIView( frame: self.view.frame )
        backgroundView.backgroundColor = UIColor( red: 1.0, green: 0.98, blue: 0.96, alpha: 1.0 )
        self.view.addSubview( backgroundView )
        
        let viewPath = UIBezierPath( rect: self.view.frame )
        let circlePath = UIBezierPath( ovalInRect: CGRect( x: 40, y: self.view.frame.height / 2 - 27, width: self.view.frame.width - 80, height: self.view.frame.width - 80 ) )
        viewPath.usesEvenOddFillRule = true
        viewPath.appendPath( circlePath )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = viewPath.CGPath
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.fillColor = UIColor.whiteColor().CGColor
        
        backgroundView.layer.mask = maskLayer
        
        // Instantiate the slider
        self.customSlider = CustomSliderView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width * 0.9, height: self.view.frame.width * 0.9 ) )
        self.customSlider.center.x = self.view.center.x
        self.customSlider.center.y = self.view.center.y + 120
        self.view.addSubview( self.customSlider )
        self.customSlider.delegate = self
        
        self.questions  = [
            [
                "Question": "Quel est votre\nniveau de stress ?",
                "Type": "String",
                "Min": 0.0,
                "Max": 10.0,
                "Answers": [ "Paisible", "Zen", "Calme", "Décontractée", "Anxieuse", "Agitée", "Inquiète", "Susceptible", "Irritée", "Sur les nerfs", "Sur les nerfs" ]
            ],
            [
                "Question": "Quel est votre\nétat d'esprit ?",
                "Type": "String",
                "Min": 0.0,
                "Max": 10.0,
                "Answers": [ "Béat", "Enthousiaste", "Optimiste", "Joyeuse", "Ravie", "Inquiète", "Triste", "Tourmentée", "Perplexe", "Déprimée", "Déprimée" ]
            ],
            [
                "Question": "Comment vous\nsentez vous ?",
                "Type": "String",
                "Min": 0.0,
                "Max": 10.0,
                "Answers": [ "Hyper-active", "Excitée", "Dynamique", "Vive", "Éveillée", "Endormie", "Absente", "Abattue", "Épuisée", "Éteint", "Éteint" ]
            ]
        ]
    
        let title = CustomTitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor( red: 0.78, green: 0.82, blue: 0.85, alpha: 1 ) )
        title.text = "Mon questionnaire"
        title.font = UIFont( name: "Santana", size: 20.0 )
        title.textAlignment = .Center
        title.textColor = UIColor( red: 0.46, green: 0.51, blue: 0.66, alpha: 1 )
        
        self.questionLabel = UILabel( frame: CGRect( x: 0, y: 120, width: self.view.frame.width, height: 80 ) )
        self.questionLabel.numberOfLines = 2
        self.questionLabel.font = UIFont( name: "Santana-Bold", size: 28.0 )
        self.questionLabel.textAlignment = .Center
        self.questionLabel.textColor = UIColor( red: 0.36, green: 0.37, blue: 0.53, alpha: 1 )
        self.questionLabel.alpha = 0.0
        
        self.sliderValueLabel = UILabel( frame: CGRect( x: 0, y: 190, width: self.view.frame.width, height: 80 ) )
        self.sliderValueLabel.font = UIFont( name: "Bellota-Regular", size: 55.0 )
        self.sliderValueLabel.textAlignment = .Center
        self.sliderValueLabel.textColor = UIColor( red: 0.9, green: 0.81, blue: 0.47, alpha: 1 )
        self.sliderValueLabel.alpha = 0.0
        
        self.view.addSubview( title )
        self.view.addSubview( self.questionLabel )
        self.view.addSubview( self.sliderValueLabel )
        
        let validateButton = ValidateButton( frame: CGRect( x: 0, y: 0, width: 50, height: 50 ), color: UIColor( red: 0.88, green: 0.74, blue: 0.36, alpha: 1.0 ) )
        validateButton.center = CGPoint( x: self.view.center.x, y: self.view.frame.height - 50 )
        let validateTap = UITapGestureRecognizer( target: self, action: "hideView:" )
        validateButton.addGestureRecognizer( validateTap )
        
        self.tutorialView = TutorialView( frame: CGRect( x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height ) )
        self.tutorialView.addSubview( validateButton )
        self.view.addSubview( self.tutorialView )
        
        self.view.alpha = 0.0
    }
    
    func hideView( recognizer: UITapGestureRecognizer ) {
        if recognizer.state == .Ended {
            UIView.animateWithDuration( 0.5, animations: {
                self.tutorialView.alpha = 0.0
            }, completion: { finished in
                self.tutorialView.hidden = true
                self.nextQuestion()
            } )
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration( 0.5, animations: {
            self.view.alpha = 1.0
        } )
    }
    
    func nextQuestion() {
        self.buildQuestion( self.index )
        
        self.getValue( 0.0 )
        
        self.questionLabel.transform = CGAffineTransformMakeScale( 1.1, 1.1 )
        self.sliderValueLabel.transform = CGAffineTransformMakeScale( 1.1, 1.1 )

        UIView.animateWithDuration( 0.5, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: {
            self.questionLabel.alpha = 1.0
            self.questionLabel.transform = CGAffineTransformMakeScale( 1.0, 1.0 )
            
            self.sliderValueLabel.alpha = 1.0
            self.sliderValueLabel.transform = CGAffineTransformMakeScale( 1.0, 1.0 )
        }, completion: nil )
    }
    
    func validateQuestion() {
        UIView.animateWithDuration( 0.5, delay: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: {
            self.questionLabel.alpha = 0.0
            self.questionLabel.transform = CGAffineTransformMakeScale( 0.9, 0.9 )

            self.delegate?.flowerProgress()
            
            self.answers.append( self.sliderValueDouble )
            self.selectedAnswersText.append( self.sliderValueLabel.text! )
            
            self.sliderValueLabel.alpha = 0.0
            self.sliderValueLabel.transform = CGAffineTransformMakeScale( 0.9, 0.9 )
        }, completion: { ( finished: Bool ) -> Void in
            self.index++
            if self.index > self.questions.count - 1 {
                self.delegate?.buildFlowerWithParams( self.answers, text: self.selectedAnswersText )
                
                UIView.animateWithDuration( 0.5, animations: {
                    self.view.alpha = 0.0
                }, completion: { finished in
                    self.dismissViewControllerAnimated( false, completion: {} )
                } )
            } else {
                self.nextQuestion()
            }
        } )
    }
    
    func buildQuestion( index: Int ) {
        self.questionLabel.text = self.questions[ index ][ "Question" ] as? String
        self.customSlider.min = self.questions[ index ][ "Min" ] as! Double
        self.customSlider.max = self.questions[ index ][ "Max" ] as! Double
        
        if self.questions[ index ][ "Type" ] as! String == "Number" {
            self.sliderValueLabel.text = String( Int( self.customSlider.min ) )
            self.sliderValueLabel.font = UIFont( name: self.sliderValueLabel.font.fontName, size: 55 )
        } else {
            let minValue: Int = Int( self.customSlider.min )
            let answers = self.questions[ index ][ "Answers" ] as! [ String ]
            self.sliderValueLabel.text = answers[ minValue ]
            self.sliderValueLabel.font = UIFont( name: self.sliderValueLabel.font.fontName, size: 35 )
        }
    }
    
    func getValue( value: Double ) {
        self.sliderValueDouble = CGFloat( value )
        
        if self.questions[ index ][ "Type" ] as! String == "Number" {
            self.sliderValueLabel.text = String( Int( value ) )
        } else {
            let answers = self.questions[ index ][ "Answers" ] as! [ String ]
            self.sliderValueLabel.text = answers[ Int( value ) ]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

