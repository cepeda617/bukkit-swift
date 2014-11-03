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
    
    ImageHelper.downloadImage(list.user!.avatar_url, { image, error in
      cell.avatarImage!.image = image
    })
    
    ImageHelper.downloadImage(list.image_url!, { image, error in
      cell.listImage!.image = image
    })
    
    return cell
  }
  
  @IBAction func unwindToList(segue: UIStoryboardSegue) {
    println("Unwinding")
  }
  
  @IBAction func unwindAndAddToList(segue: UIStoryboardSegue) {
    let source = segue.sourceViewController as AddListViewController
    let list:List = source.list!
    
    if list.name != "" {
      println("Creating list: \(list.name)")
      self.tableView.reloadData()
    }
  }
}
