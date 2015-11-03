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
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // GET USERCONNECTED VALUE
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)!
        }
        if let dict = myDict {
            userConnected = dict["connectedUser"] as! NSString;
        }
        
        if(userConnected == ""){
            print("No user connected")
            //APPELLER UNE MODAL
            let connectionStoryboard: UIStoryboard = UIStoryboard(name: "Connection", bundle: nil)
            let connectionPage = connectionStoryboard.instantiateViewControllerWithIdentifier("ConnectionPage") as! ConnectionController
            presentViewController( connectionPage, animated: false, completion: nil )
        }
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}