//
//  IntroViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/9/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    
    @IBOutlet weak var tileOne: UIImageView!
    @IBOutlet weak var tileTwo: UIImageView!
    @IBOutlet weak var tileThree: UIImageView!
    @IBOutlet weak var tileFour: UIImageView!
    @IBOutlet weak var tileFive: UIImageView!
    @IBOutlet weak var tileSix: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        introScrollView.delegate = self

        introScrollView.contentSize = introImage.image!.size
        
        //Bunny ears
        self.tileOne.transform = CGAffineTransformMakeRotation(CGFloat(-10 * M_PI / 180))

        //Lochness
        self.tileFour.transform = CGAffineTransformMakeRotation(CGFloat(15 * M_PI / 180))

        //Dear
        self.tileTwo.transform = CGAffineTransformMakeRotation(CGFloat(-10 * M_PI / 180))

        //Fish
        self.tileThree.transform = CGAffineTransformMakeRotation(CGFloat(15 * M_PI / 180))

        //Girl & Dog
        self.tileSix.transform = CGAffineTransformMakeRotation(CGFloat(-11 * M_PI / 180))

        //Cabin
        self.tileFive.transform = CGAffineTransformMakeRotation(CGFloat(12 * M_PI / 180))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }

}
