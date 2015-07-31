//
//  ViewController.swift
//  step9_javascript_to_swift_return_value
//
//  Created by Zia Khan on 31/07/2015.
//  Copyright © 2015 Panacloud. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler, UIWebViewDelegate {
    
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        // Setup WKUserContentController instance for injecting user script
        let userController:WKUserContentController = WKUserContentController()
        
        // Add a script message handler for receiving  "swiftButtonClicked" event notifications posted from the JS document using window.webkit.messageHandlers.buttonClicked.postMessage script message
        userController.addScriptMessageHandler(self, name: "swiftButtonClicked")
        
        configuration.userContentController = userController
        
        /* Now instantiate the web view */
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        if let theWebView = webView {
            //Note that www is now a folder (blue) not a group (yellow), do you know the difference between the two?
            let url = NSBundle.mainBundle().URLForResource("index", withExtension:"html", subdirectory: "www")
            //theWebView.loadFileURL(url!, allowingReadAccessToURL: url!)
            theWebView.loadRequest(NSURLRequest(URL: url!))
            
            theWebView.navigationDelegate = self
            
            view.addSubview(theWebView)
            //print("method executed")
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func userContentController(userContentController: WKUserContentController,
        didReceiveScriptMessage message: WKScriptMessage) {
            
            print("Swift function called")
            
            if let messageBody:NSDictionary = message.body as? NSDictionary {
                let idOfTappedButton:String = messageBody["ButtonId"] as! String
                
                print("Html button pressed with id: " + idOfTappedButton)
                sendAnswer("Horray")
            }
    }
    
    
    //https://tetontech.wordpress.com/2014/07/15/swift-to-javascript-and-javascript-to-swift-a-round-trip/
    func sendAnswer(ans: String) {
        webView!.evaluateJavaScript("receivedAnswer(\"This is a message from Swift\")", completionHandler: nil)
        print("sending string back to javascript")
    }
    
    
}



