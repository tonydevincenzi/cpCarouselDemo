//
//  TutorialViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/9/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonParentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorialScrollView.delegate = self
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568)
        buttonParentView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidEndDecelerating(tutorialScrollView: UIScrollView!) {
        let page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
        self.pageControl.currentPage = page
        
        if(page == 3)
        {
            buttonParentView.hidden = false
            pageControl.hidden = true
            UIView.animateWithDuration(0.5, animations: {
                self.buttonParentView.alpha = 1
            })
        } else {
            buttonParentView.hidden = true
            pageControl.hidden = false
        }
    }
}
