//
//  CreateViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/11/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var createScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView.delegate = self
        
        createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -220
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backClicked(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    func keyboardWillShow(notification: NSNotification!) {
        
        print("keys")
        
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        createScrollView.contentOffset.y = createScrollView.contentInset.bottom
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 50 {
            view.endEditing(true)
        }
    }

    @IBAction func checkBoxClicked(sender: AnyObject) {
        checkBoxButton.selected = !checkBoxButton.selected
    }
}
