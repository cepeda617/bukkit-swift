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
  var complete: Bool?
  var url: NSURL?
  var image_url: NSURL?
  var follow_url: NSURL?
  var unfollow_url: NSURL?
  var user: User?
  
  init(json: JSON) {
    self.id = json["id"].intValue
    self.name = json["name"].stringValue
    self.user_id = json["user_id"].intValue
    self.complete = json["complete"].boolValue
    self.url = NSURL(string: json["url"].stringValue)
    self.image_url = NSURL(string: json["image_url"].stringValue)
    self.follow_url = NSURL(string: json["follow_url"].stringValue)
    self.unfollow_url = NSURL(string: json["unfollow_url"].stringValue)
    self.user = User(json: json["user"])
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
  
  class func find(id: String, callback: (List) -> Void) {
    Alamofire.request(Router.ReadList(id)).responseJSON { (request, response, json, error) in
      var list = List(json: JSON(json!))
      callback(list)
    }
  }
}
