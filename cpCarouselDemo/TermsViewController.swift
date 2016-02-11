//
//  TermsViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/11/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var termsWebView: UIWebView!
    
    let url = "https://www.dropbox.com/terms?mobile=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        termsWebView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
