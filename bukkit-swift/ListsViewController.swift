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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    API.lists { (lists) in
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
    return list.into_cell(cell)
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
