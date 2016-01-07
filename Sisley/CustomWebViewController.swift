//
//  CustomWebViewController
//  Sisley
//
//  Created by Soufiane Lasri on 09/11/2015.
//  Copyright © 2015 Soufiane Lasri. All rights reserved.
//
//

import UIKit

protocol CustomWebViewDelegate: class {
    func listenTransitionState( data: [ String : String ] )
}

class CustomWebView: UIView, UIWebViewDelegate {
    
    var webView: UIWebView!
    var customWebViewDelegate: CustomWebViewDelegate?
    
    override init( frame: CGRect ) {
        super.init( frame: frame )
        
        self.webView = UIWebView( frame: self.frame )
        self.webView.delegate = self
        self.webView.scrollView.scrollEnabled = true
        self.webView.scrollView.bounces = false
        self.webView.backgroundColor = UIColor.clearColor()
        self.webView.opaque = false
        
        let localfilePath = NSBundle.mainBundle().URLForResource( "index", withExtension: "html" )
        let myRequest = NSURLRequest( URL: localfilePath! )
        self.webView.loadRequest( myRequest )

        self.addSubview( self.webView )
    }
    
    func webViewDidFinishLoad( webView: UIWebView ) {
        let delay = 2.0 * Double( NSEC_PER_SEC )
        let time = dispatch_time( DISPATCH_TIME_NOW, Int64( delay ) )
        dispatch_after( time, dispatch_get_main_queue() ) {
            self.webView.stringByEvaluatingJavaScriptFromString( "window.mediator.publish( 'flowerGrow', { stress: 0.0, tiredness: 0.0, mood: 0.0 } );" )
        }    
    }
    
    func webView( webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType ) -> Bool {
        if request.URL?.scheme == "flower" {
            let params = getParams( ( request.URL?.query )! as String )
            self.customWebViewDelegate?.listenTransitionState( params )
            return false
        } else {
            return true
        }
    }
    
    func getParams( URLString: String? ) -> [ String : String ] {
        var results: [ String : String ] = [:]
        if let pairs = URLString?.componentsSeparatedByString( "&" ) where pairs.count > 0 {
            for pair: String in pairs {
                if let keyValue = pair.componentsSeparatedByString( "=" ) as [ String ]? {
                    results.updateValue( keyValue[ 1 ], forKey: keyValue[ 0 ] )
                }
            }
        }
        return results
    }
    
    func flowerToSeed() {
        self.webView.stringByEvaluatingJavaScriptFromString( "window.mediator.publish( 'flowerToSeed' );" )
    }
    
    func flowerProgress() {
        self.webView.stringByEvaluatingJavaScriptFromString( "window.mediator.publish( 'flowerProgress' );" )
    }
    
    func buildFlowerWithParams( stress: CGFloat, tiredness: CGFloat, mood: CGFloat ) {
        self.webView.stringByEvaluatingJavaScriptFromString( "window.mediator.publish( 'flowerGrow', { stress: " + String( stress  ) + ", tiredness: " + String( tiredness ) + ", mood: " + String( mood ) + " } );" )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}