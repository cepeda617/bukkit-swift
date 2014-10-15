//
//  User.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/11/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserManager {

  func fetch() {
    Alamofire.request(Router.Users()).responseJSON { (request, response, json, error) in
      var users = [User]()
      for (index: String, subJson: JSON) in JSON(json!) {
        users.append(User(json: subJson))
      }
      // render users
    }
  }
  
  func get(id: String) {
    Alamofire.request(Router.ReadUser(id)).responseJSON { (request, response, json, error) in
      var user = User(json: JSON(json!))
      // render user
    }
  }
}

class User {
  var id: Int
  var name: String
  var email: String
  var avatar_url: String
  var url: String
  
  init(json: JSON) {
    self.id = json["id"].intValue
    self.name = json["name"].stringValue
    self.email = json["email"].stringValue
    self.avatar_url = json["avatar_url"].stringValue
    self.url = json["url"].stringValue
  }
}
