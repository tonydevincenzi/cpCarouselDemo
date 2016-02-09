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
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    var signInTitle = ""
    var signInMessage = ""
    var delayTime = 0.75
    
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
        buttonOffset = -120
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
