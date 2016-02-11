//
//  LearnMoreViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/11/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class LearnMoreViewController: UIViewController {

    @IBOutlet weak var buttonFullScreen: UIButton!
    @IBOutlet weak var labelFullScreen: UILabel!
    @IBOutlet weak var buttonSwipe: UIButton!
    @IBOutlet weak var labelSwipe: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let didViewFullScreen = NSUserDefaults.standardUserDefaults().boolForKey("did_fullscreen")
        let didSwipe = NSUserDefaults.standardUserDefaults().boolForKey("did_swipe")
        
        if didViewFullScreen == true {
            buttonFullScreen.setImage(UIImage(named: "checkbox_complete.png"), forState: UIControlState.Normal)
            labelFullScreen.textColor = UIColor.greenColor()
        }
        
        if didSwipe == true {
            buttonSwipe.setImage(UIImage(named: "checkbox_complete.png"), forState: UIControlState.Normal)
            labelSwipe.textColor = UIColor.greenColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
