//
//  LoginSignInVC.swift
//  TapglueSample
//
//  Created by Özgür Celebi on 14/12/15.
//  Copyright © 2015 Özgür Celebi. All rights reserved.
//

import UIKit
import Tapglue

class LoginSignInVC: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(animated: Bool) {
        // Show navigationBar again when view disappears
        self.navigationController?.navigationBarHidden = false
    }
    
    @IBAction func signInButtonPressed(sender: UIButton) {
        // If all textFields have more then 2 characters, begin Tapglue login
        if userNameTextField.text?.characters.count > 2 && passwordTextField.text?.characters.count > 2 {
            1
            let username = userNameTextField.text!
            let password = passwordTextField.text!
            
            Tapglue.loginWithUsernameOrEmail(username, andPasswort: password, withCompletionBlock: { (success: Bool, error: NSError!) -> Void in
                if error != nil {
                    print("\nError loginWithUsernameOrEmail: \(error)")
                } else {
                    print("\nUser loged in: \(success)")
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.navigationController?.popToRootViewControllerAnimated(false)
                    })
                }
            })
        } else {
            print("Please enter all details and select an avatar")
        }
    }
}
