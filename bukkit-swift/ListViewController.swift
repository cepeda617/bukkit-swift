//
//  ListViewController.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 11/3/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
  var list: List!
  var header = UIView()
  
  func setupHeader() {
    let avatarImage = UIImageView()
    avatarImage.image = list.user!.avatar
    avatarImage.frame = CGRect(x:10, y:10, width:40, height:40)
    header.addSubview(avatarImage)
    
    let nameLabel = UILabel()
    nameLabel.text = list.name
    nameLabel.frame = CGRect(x:60, y:10, width:330, height:20)
    nameLabel.font = UIFont.boldSystemFontOfSize(17)
    header.addSubview(nameLabel)
    
    let userLabel = UILabel()
    userLabel.text = list.user!.name
    userLabel.frame = CGRect(x:60, y:30, width:330, height:20)
    userLabel.font = UIFont.systemFontOfSize(14)
    userLabel.textColor = UIColor.lightGrayColor()
    header.addSubview(userLabel)
    
    let listImage = UIImageView()
    listImage.image = list.image
    listImage.frame = CGRect(x:10, y:60, width:380, height:140)
    header.addSubview(listImage)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupHeader()
    
    list.fetch { (fetched_list) in
      self.list = fetched_list
      self.tableView.reloadData()
    }
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      // #warning Potentially incomplete method implementation.
      // Return the number of sections.
      return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete method implementation.
      // Return the number of rows in the section.
    return list.list_items.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> ListItemCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ListItemCell") as ListItemCell
    let list_item: ListItem = self.list.list_items[indexPath.row]
    
    cell.nameLabel.text = list_item.name

    return cell
  }
  
  override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return header
  }
  
  override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 250
  }


  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
      // Return NO if you do not want the specified item to be editable.
      return true
  }
  */

  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
      if editingStyle == .Delete {
          // Delete the row from the data source
          tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
      } else if editingStyle == .Insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      }    
  }
  */

  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

  }
  */

  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
      // Return NO if you do not want the item to be re-orderable.
      return true
  }
  */
  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    println("preparing for segue")
  }
  */
}
