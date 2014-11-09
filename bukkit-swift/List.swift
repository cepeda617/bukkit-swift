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
  
  class func all(callback: ([List]) -> Void) {
    Alamofire.request(Router.Lists()).responseJSON { (request, response, json, error) in
      var lists = [List]()
      for (index: String, subJson: JSON) in JSON(json!) {
        lists.append(List(json: subJson))
      }
      callback(lists)
    }
  }
  
  class func find(id: Int, callback: (List) -> Void) {
    Alamofire.request(Router.ReadList(id.description)).responseJSON { (request, response, json, error) in
      var list = List(json: JSON(json!))
      callback(list)
    }
  }
  
  func fetch(callback: (List) -> Void) {
    Alamofire.request(.GET, url!).responseJSON { (request, response, json, error) in
      var list = List(json: JSON(json!))
      callback(list)
    }
  }
  
  func add_image_to_view(image_view: UIImageView) {
    ImageHelper.downloadImage(self.image_url!, { image, error in
      image_view.image = image
      self.image = image
    })
  }
}
