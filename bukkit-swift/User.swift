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
import UIKit

class User {
  var id: Int
  var name: String
  var email: String
  var avatar_url: NSURL?
  var url: NSURL
  
  var avatar: UIImage?
  
  init(json: JSON) {
    self.id = json["id"].intValue
    self.name = json["name"].stringValue
    self.email = json["email"].stringValue
    self.avatar_url = NSURL(string: json["avatar_url"].stringValue)
    self.url = NSURL(string: json["url"].stringValue)
  }
  
  class func fetch(callback: ([User]) -> Void) {
    Alamofire.request(Router.Users()).responseJSON { (request, response, json, error) in
      var users = [User]()
      for (index: String, subJson: JSON) in JSON(json!) {
        users.append(User(json: subJson))
      }
      callback(users)
    }
  }
  
  class func find(id: String, callback: (User) -> Void) {
    Alamofire.request(Router.ReadUser(id)).responseJSON { (request, response, json, error) in
      var user = User(json: JSON(json!))
      callback(user)
    }
  }
  
  func add_image_to_view(image_view: UIImageView) {
    ImageHelper.downloadImage(self.avatar_url!, { image, error in
      image_view.image = image
      self.avatar = image
    })
  }
}
