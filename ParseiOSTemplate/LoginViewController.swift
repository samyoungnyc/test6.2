//
//  ViewController.swift
//  ParseiOSTemplate
//
//  Created by Computer on 3/9/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

import UIKit

class LoginViewController: UITabBarController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
        
        self.loginSetup()
        
    }
    
    // MARK: Parse Login
    
    func logInViewController(logInController: PFLogInViewController!, shouldBeginLogInWithUsername username: String!, password: String!) -> Bool {
        if (!username.isEmpty) || (!password.isEmpty) {
            return true
        } else {
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController!, didFailToLogInWithError error: NSError!) {
        println("failed to login")
    }
    
    
    // MARK: Parse SignUp
    
    func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didFailToSignUpWithError error: NSError!) {
        println("failed signup")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController!) {
        println("user dismissed sign up")
    }
    
    func loginSetup() {
        if PFUser.currentUser() == nil {
            let loginViewController = PFLogInViewController()
            loginViewController.delegate = self
            
            let signupViewController = PFSignUpViewController()
            signupViewController.delegate = self
            
            loginViewController.signUpController = signupViewController
            
            self.presentViewController(loginViewController, animated: true, completion: nil)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

