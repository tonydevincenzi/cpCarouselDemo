//
//  LoginViewController.swift
//  cpCarouselDemo
//
//  Created by Anthony Devincenzi on 2/9/16.
//  Copyright © 2016 Anthony Devincenzi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signInEmailTextField: UITextField!
    @IBOutlet weak var signInPasswordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var signInNavigation: UIImageView!
    @IBOutlet weak var signInFields: UIView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    var signInTitle = ""
    var signInMessage = ""
    var delayTime = 0.0
    
    var userCredentials: [String:String] = [
        "emails" : "john@acme.com",
        "password" : "acmecorp"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScrollView.delegate = self
        
        
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -220
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let transform = CGAffineTransformMakeScale(0.7, 0.7)
        signInNavigation.transform = transform
        signInNavigation.alpha = 1
        signInFields.transform = transform
        signInFields.alpha = 1
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.signInNavigation.transform = CGAffineTransformIdentity
            self.signInNavigation.alpha = 1
            self.signInFields.transform = CGAffineTransformIdentity
            self.signInFields.alpha = 1
        }
    }
    
    @IBAction func signInClicked(sender: AnyObject) {
        
        if  signInEmailTextField.text!.isEmpty {
            signInTitle = "Email Required"
            signInMessage = "Please enter your email address"
            showAlertController();

        } else {
            tryLogIn()
        }
    }
    
    func tryLogIn() {
        
        activityIndicator.hidden = false
        self.activityIndicator.startAnimating()
        delay(delayTime) { () -> () in
            if(self.signInPasswordTextField.text == self.userCredentials["password"]){
                //success
                print("Successfully logged in")
                self.performSegueWithIdentifier("signInComplete", sender: nil)
            } else
            {
                //fail
                self.signInTitle = "Incorrect Password"
                self.signInMessage = "Your password did not match the hard-coded and extremely vulnerable value being held in plain text"
                self.activityIndicator.hidden = true
                self.activityIndicator.stopAnimating()
                self.showAlertController()
            }
        }
    }
    
    func showAlertController() {
        
        let alertController = UIAlertController(title: signInTitle, message: signInMessage, preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        alertController.addAction(OKAction)
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
        
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= 50 {
            // Hide the keyboard
            print("done")
            view.endEditing(true)
        }
    }
    
    @IBAction func backClicked(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
