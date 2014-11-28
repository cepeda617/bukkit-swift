//
//  List.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/11/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class List {
  var id: Int?
  var name: String
  var user_id: Int?
  var completed: Bool?
  var url: NSURL?
  var image_url: NSURL?
  var follow_url: NSURL?
  var unfollow_url: NSURL?
  var user: User?
  var list_items: [ListItem] = []
  
  var image: UIImage?
  
  init(json: JSON) {
    self.id = json["id"].intValue
    self.name = json["name"].stringValue
    self.user_id = json["user_id"].intValue
    self.completed = json["completed"].boolValue
    self.url = NSURL(string: json["url"].stringValue)
    self.image_url = NSURL(string: json["image_url"].stringValue)
    self.follow_url = NSURL(string: json["follow_url"].stringValue)
    self.unfollow_url = NSURL(string: json["unfollow_url"].stringValue)
    self.user = User(json: json["user"])
    
    if list_items.isEmpty && json["list_items"] {
      for (index, item) in json["list_items"] {
        let list_item = ListItem(json: item)
        self.list_items.append(list_item)
      }
    }
  }
  
  init(name: String) {
    self.name = name
  }
  
  func fetch(callback: (List) -> Void) {
    Alamofire.request(.GET, url!).responseJSON { (request, response, json, error) in
      var list = List(json: JSON(json!))
      callback(list)
    }
  }
  
  func add_image_to(image_view: UIImageView) {
    ImageHelper.downloadImage(self.image_url!, { image, error in
      image_view.image = image
      image_view.layer.cornerRadius = 4
      image_view.clipsToBounds = true
      self.image = image
    })
  }
  
  func to_view() -> UIView {
    let view = UIView()
    
    let avatarImage = UIImageView()
    avatarImage.image = self.user!.avatar
    avatarImage.frame = CGRect(x:10, y:10, width:40, height:40)
    view.addSubview(avatarImage)
    
    let nameLabel = UILabel()
    nameLabel.text = self.name
    nameLabel.frame = CGRect(x:60, y:10, width:330, height:20)
    nameLabel.font = UIFont.boldSystemFontOfSize(17)
    view.addSubview(nameLabel)
    
    let userLabel = UILabel()
    userLabel.text = self.user!.name
    userLabel.frame = CGRect(x:60, y:30, width:330, height:20)
    userLabel.font = UIFont.systemFontOfSize(14)
    userLabel.textColor = UIColor.lightGrayColor()
    view.addSubview(userLabel)
    
    let listImage = UIImageView()
    listImage.image = self.image
    listImage.frame = CGRect(x:10, y:60, width:380, height:140)
    view.addSubview(listImage)
    
    self.user?.add_image_to(avatarImage)
    self.add_image_to(listImage)
    
    return view
  }
  
  func into_cell(cell: ListCell) -> ListCell {
    cell.nameLabel?.text = self.name
    cell.userLabel?.text = self.user!.name
    self.user?.add_image_to(cell.avatarImage!)
    self.add_image_to(cell.listImage!)
    return cell
  }
}
