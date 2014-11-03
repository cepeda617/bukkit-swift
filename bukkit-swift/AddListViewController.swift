//
//  AddListViewController.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 11/2/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {
  
  var list: List?
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var doneButton: UIBarButtonItem!

  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    if (countElements(self.textField.text) > 0) {
      self.list = List(name: self.textField.text)
    }
  }

}
