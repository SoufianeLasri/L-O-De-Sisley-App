//
//  ViewController.swift
//  Sisley
//
//  Created by Soufiane Lasri on 23/10/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userConnected: NSString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor( red: 1, green: 0.98, blue: 0.96, alpha: 1 )
        
        let title = UITitle( frame: CGRect( x: 0, y: 30, width: self.view.frame.width, height: 30 ), color: UIColor(red:0.78, green:0.82, blue:0.85, alpha:1) )
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
        
        self.view.addSubview( title )
        self.view.addSubview( question )
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        printFonts()
        
        // ##
        // TEST CONNECTION
        // - GET USERCONNECTED VALUE
//        var myDict: NSDictionary?
//        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
//            myDict = NSDictionary(contentsOfFile: path)!
//        }
//        if let dict = myDict {
//            userConnected = dict["connectedUser"] as! NSString;
//        }
//        // - CHOOSE THE GOOD VIEW
//        if(userConnected == ""){
//            print("No user connected")
//            let connectionStoryboard: UIStoryboard = UIStoryboard(name: "Connection", bundle: nil)
//            let connectionPage = connectionStoryboard.instantiateViewControllerWithIdentifier("ConnectionPage") as! ConnectionController
//            presentViewController( connectionPage, animated: false, completion: nil )
//        } else {
//            let flowerStoryboard: UIStoryboard = UIStoryboard(name: "Flower", bundle: nil)
//            let flowerPage = flowerStoryboard.instantiateViewControllerWithIdentifier("FlowerPage") as! FlowerController
//            presentViewController( flowerPage, animated: false, completion: nil )
//        }

   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames()
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNamesForFamilyName(familyName )
            print("Font Names = [\(names)]")
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}