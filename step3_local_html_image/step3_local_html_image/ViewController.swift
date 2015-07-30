//
//  ViewController.swift
//  step3_local_html_image
//
//  Created by Zia Khan on 30/07/2015.
//  Copyright © 2015 Panacloud. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        /* Now instantiate the web view */
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        if let theWebView = webView{
            let url = NSBundle.mainBundle().URLForResource("index", withExtension:"html", subdirectory: "www")
            theWebView.loadFileURL(url!, allowingReadAccessToURL: url!)
            
            theWebView.navigationDelegate = self
            view.addSubview(theWebView)
            print("method executed")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

