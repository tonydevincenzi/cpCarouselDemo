//
//  TimeLineViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/9/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var learnMoreParent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedScrollView.contentSize = feedImageView.image!.size

        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "did_fullscreen")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "did_swipe")
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "did_share")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeLearnMoreClicked(sender: AnyObject) {
        learnMoreParent.hidden = true
        feedScrollView.frame.origin.y = 64
    }

}
