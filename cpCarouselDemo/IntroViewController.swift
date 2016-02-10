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
        //tileOne.frame.origin.y = 472
        //tileOne.frame.origin.x = -43
        
        //tileOne.transform = CGAffineTransformMakeDegreeRotation(-10)
        //self.tileOne.transform = CGAffineTransformMakeRotation(CGFloat(-10 * M_PI / 180))
        
        //Lochness
        //self.tileFour.transform = CGAffineTransformMakeRotation(CGFloat(15 * M_PI / 180))
        //self.tileFour.frame.origin.y = 477
        //self.tileFour.frame.origin.x = 103
        
        //Dear
        //self.tileTwo.transform = CGAffineTransformMakeRotation(CGFloat(-10 * M_PI / 180))
        //self.tileTwo.frame.origin.y = 125
        //self.tileTwo.frame.origin.x = 205
        
        //Fish
        //self.tileThree.transform = CGAffineTransformMakeRotation(CGFloat(15 * M_PI / 180))
        //self.tileThree.frame.origin.y = 180
        //self.tileThree.frame.origin.x = 373
        
        //Girl & Dog
        //self.tileSix.transform = CGAffineTransformMakeRotation(CGFloat(-11 * M_PI / 180))
        //self.tileSix.frame.origin.y = 70
        //self.tileSix.frame.origin.x = 391
        
        //Cabin
        //self.tileFive.transform = CGAffineTransformMakeRotation(CGFloat(12 * M_PI / 180))
        //self.tileFive.frame.origin.y = -26
        //self.tileFive.frame.origin.x = 356
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        //-20 start
        //568 end
        
        //let transform = CGAffineTransformMakeScale(1, 1)
        //tileOne.transform = transform
        
        //attempt to convert value
        let tileOneY = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: 307, r2Max: 746)
        let tileOneX = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: 46, r2Max: 46)
        let tileOneRot = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: -10, r2Max: 0)

        tileOne.frame.origin.y = tileOneY
        tileOne.frame.origin.x = tileOneX
        //tileOne.transform = CGAffineTransformMakeDegreeRotation(tileOneRot)
        
        let tileTwoY = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: 307, r2Max: 746)
        tileTwo.frame.origin.y = tileTwoY
        
        let tileThreeY = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: 385, r2Max: 824)
        tileThree.frame.origin.y = tileThreeY
        
        let tileFourY = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: 462, r2Max: 901)
        tileFour.frame.origin.y = tileFourY
        
        let tileFiveY = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: 462, r2Max: 901)
        tileFive.frame.origin.y = tileFiveY
        
        let tileSixY = convertValue(scrollView.contentOffset.y, r1Min: -20, r1Max: 568, r2Min: 462, r2Max: 901)
        tileSix.frame.origin.y = tileSixY
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
