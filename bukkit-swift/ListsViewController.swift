//
//  ListsViewController.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/24/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation
import UIKit

class ListsViewController: UITableViewController {
  var lists: [List] = []
  
  func setupNavigationBar() {
//    let navbar = self.navigationController!.navigationBar
//    navbar.barTintColor = Bukkit.Color.blue()
//    navbar.tintColor = UIColor.whiteColor()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupNavigationBar()
    
    List.all { (lists) in
      self.lists = lists
      self.tableView.reloadData()
    }
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return lists.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> ListCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("ListCell") as ListCell
    var list:List = self.lists[indexPath.row]
    
    cell.nameLabel?.text = list.name
    cell.userLabel?.text = list.user!.name
    
    list.user?.add_image_to_view(cell.avatarImage!)
    cell.avatarImage?.layer.cornerRadius = 4
    cell.avatarImage?.clipsToBounds = true
    
    list.add_image_to_view(cell.listImage!)
    cell.listImage?.layer.cornerRadius = 4
    cell.listImage?.clipsToBounds = true
    
    return cell
  }
  
  @IBAction func unwindToList(segue: UIStoryboardSegue) {
    println("Unwinding")
  }
  
  @IBAction func unwindAndAddToList(segue: UIStoryboardSegue) {
    let source = segue.sourceViewController as AddListViewController
    let list:List = source.list!
    
    if list.name != "" {
      println("TODO: Create list \(list.name)")
      self.tableView.reloadData()
    }
  }
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    if segue.identifier == "ListDetailSegue" {
      let index_path = tableView.indexPathForSelectedRow()!
      let list = self.lists[index_path.row]
      let controller = segue.destinationViewController.topViewController as ListViewController
      controller.list = list
      
    } else if segue.identifier == "AddListSegue" {
      // Opening add list view
    }
  }
}
