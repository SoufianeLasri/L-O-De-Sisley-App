//
//  CustomWebViewController
//  Sisley
//
//  Created by Soufiane Lasri on 09/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//
//
import UIKit

class CustomWebViewController: UIViewController, UIWebViewDelegate {
    
    @IBAction func growFlower(sender: AnyObject) {
        self.webView.stringByEvaluatingJavaScriptFromString("flowerLoad()")
    }
    
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
    
    func webViewDidFinishLoad(webView: UIWebView) {
       self.webView.stringByEvaluatingJavaScriptFromString("window.mediator.publish('flowerLoad',{});")
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.URL?.scheme == "test" {
            print(getParams((request.URL?.query)! as String))
            return false
        } else {
            return true
        }
    }
    
    func getParams( URLString: String? ) -> NSDictionary {
        var results = [String: String]()
        if let pairs = URLString?.componentsSeparatedByString("&") where pairs.count > 0 {
            for pair: String in pairs {
                if let keyValue = pair.componentsSeparatedByString("=") as [String]? {
                    results.updateValue(keyValue[1], forKey: keyValue[0])
                }
            }
        }
        return results
    }
    
    func test( params1: Int, params2: Int ) {
        
    }
}