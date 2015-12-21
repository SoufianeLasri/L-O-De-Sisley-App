//
//  CustomWebViewController
//  Sisley
//
//  Created by Soufiane Lasri on 09/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//
//

import UIKit
import WebKit

class CustomWebViewController: UIView, UIWebViewDelegate {
    
    var webView: UIWebView!
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.webView = UIWebView( frame: self.frame )
        self.webView.delegate = self
        self.webView.scrollView.scrollEnabled = true
        self.webView.scrollView.bounces = false
        self.webView.backgroundColor = UIColor( red: 1.0, green: 0.96, blue: 0.91, alpha: 1.0 )
        self.backgroundColor = UIColor.yellowColor()
        
        let localfilePath = NSBundle.mainBundle().URLForResource( "index", withExtension: "html" )
        let myRequest = NSURLRequest( URL: localfilePath! )
        self.webView.loadRequest( myRequest )

        self.addSubview( self.webView )
    }
    
    func webViewDidFinishLoad( webView: UIWebView ) {
        let delay = 0.1 * Double( NSEC_PER_SEC )
        let time = dispatch_time( DISPATCH_TIME_NOW, Int64( delay ) )
        dispatch_after( time, dispatch_get_main_queue() ) {
            self.webView.stringByEvaluatingJavaScriptFromString( "window.mediator.publish( 'flowerLoad' );" )
            self.webView.stringByEvaluatingJavaScriptFromString( "window.mediator.publish( 'flowerGrow', { stress: 1.0, tiredness: 1.0, mood: 1.0 } );" )
        }
    }
    
    func webView( webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType ) -> Bool {
        if request.URL?.scheme == "test" {
            print( getParams( ( request.URL?.query )! as String ) )
            return false
        } else {
            return true
        }
    }
    
    func getParams( URLString: String? ) -> NSDictionary {
        var results = [ String: String ]()
        if let pairs = URLString?.componentsSeparatedByString( "&" ) where pairs.count > 0 {
            for pair: String in pairs {
                if let keyValue = pair.componentsSeparatedByString( "=" ) as [ String ]? {
                    results.updateValue( keyValue[ 1 ], forKey: keyValue[ 0 ] )
                }
            }
        }
        return results
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}