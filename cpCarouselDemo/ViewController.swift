//
//  ViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/5/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainScrollView: UIScrollView!

    @IBOutlet weak var tileOne: UIImageView!
    @IBOutlet weak var tileTwo: UIImageView!
    @IBOutlet weak var tileThree: UIImageView!
    @IBOutlet weak var tileFour: UIImageView!
    @IBOutlet weak var tileFive: UIImageView!
    @IBOutlet weak var tileSix: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.contentSize = CGSize(width:320, height:1136)
        
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


}

