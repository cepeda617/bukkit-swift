//
//  SignInViewController.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 11/16/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  @IBOutlet weak var submitButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  

  // MARK: - Navigation
  
  override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
    var should_allow = false
    
    if identifier == "signinSegue" {
      let alert = UIAlertView()
      
      if (emailField.text.isEmpty || passwordField.text.isEmpty) {
        alert.title = "Missing fields"
        alert.message = "Please include both email and password."
        alert.addButtonWithTitle("Ok")
        alert.show()
      }
      else {
        API.signin(emailField.text, password: passwordField.text) { (authorized) in
          if (authorized) {
            self.performSegueWithIdentifier("signinSegue", sender: self)
          }
        }
      }
    }
    
    return should_allow
  }

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
  }

}
