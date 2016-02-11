//
//  ImageGalleryViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/11/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self

        scrollView.contentSize = CGSize(width: 960, height: 568)
        scrollView.contentOffset.x = 320
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTap(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "did_fullscreen")
        NSUserDefaults.standardUserDefaults().synchronize()
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func scrollViewDidEndDecelerating(tutorialScrollView: UIScrollView) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "did_swipe")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

}
