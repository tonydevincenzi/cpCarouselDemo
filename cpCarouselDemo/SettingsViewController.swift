//
//  SettingsViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/9/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScrollView.contentSize = settingsImageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func settingsCloseClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func signOutClicked(sender: AnyObject) {
    }
    
    

}
