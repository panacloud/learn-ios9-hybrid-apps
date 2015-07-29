//
//  ViewController.swift
//  step1_safari_webview
//
//  Created by Zia Khan on 29/07/2015.
//  Copyright © 2015 Panacloud. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        //Create the safari view controller
        let sfVC = SFSafariViewController(URL: NSURL(string:"https://google.com")!, entersReaderIfAvailable: true)
        sfVC.delegate = self
        
        //Show the browser
        self.presentViewController(sfVC, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Delegate method for dismissing it
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }



}

