//
//  SignupViewController.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 11/10/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
  
  @IBOutlet weak var nameField: UITextField!
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
  
  @IBAction func signup() {
    println("Sign up")
  }

  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
    // Validate and alert if problem signing up
    return true
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
  }

}
