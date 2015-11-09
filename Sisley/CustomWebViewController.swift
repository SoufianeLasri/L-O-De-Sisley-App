//
//  CustomWebViewController
//  Sisley
//
//  Created by Soufiane Lasri on 09/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//

import UIKit

class CustomWebViewController: UIViewController, UIWebViewDelegate {
    
    var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView = UIWebView( frame: self.view.bounds )
        self.webView.delegate = self
        self.webView.scrollView.scrollEnabled = true
        self.webView.scrollView.bounces = false
        self.view = self.webView
        
        let localfilePath = NSBundle.mainBundle().URLForResource( "index", withExtension: "html" )
        let myRequest = NSURLRequest( URL: localfilePath! )
        self.webView.loadRequest( myRequest )
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.URL?.absoluteString.rangeOfString("http") != nil {
            UIApplication.sharedApplication().openURL(request.URL!);
            return false
        } else {
            return true
        }
    }
    
    //    stringByEvaluatingJavaScriptFromString
}