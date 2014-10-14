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
  class func all() {
    var users = Array<User>()
    Alamofire.request(.GET, "http://localhost:3000/api/v1/users?token=97507b3209a119d52cc289c6c1b187e2")
      .responseJSON { (request, response, json, error) in
        let json = JSON(json!)
        for (index: String, subJson: JSON) in json {
          users.append(User(json: subJson))
        }
      }
    }
    
//    BukkitAPI().manager.request(.GET, "http://localhost:3000/api/v1/users")
//      .responseJSON { (request, response, JSON, error) in
//        println(request)
//        println(response)
//        println(JSON)
//        println(error)
//    }
//    var users = Users()
//    API().request.GET("/users", parameters: nil, success: { (response: HTTPResponse) in
//      if response.responseObject != nil {
////        let dict = response.responseObject as Dictionary<String,AnyObject>
////        println("example of the JSON key: \(dict["users"])")
//        println("print the whole response: \(JSONDecoder(response.responseObject!))")
//        users = Users(JSONDecoder(response.responseObject!))
//      }
//    }, failure: { (error: NSError) in
//      println("error: \(error)")
//    })
//    println(users.users)
//    return users
//  }
}

class User {
  var id: Int?
  var name: String?
  var email: String?
  var avatar_url: String?
  var url: String?
  
  init(id: Int, name: String, email: String, avatar_url: String, url: String) {
    self.id = id
    self.name = name
    self.email = email
    self.avatar_url = avatar_url
    self.url = url
  }
  
  init(json: JSON) {
    self.id = json["id"].intValue
    self.name = json["name"].stringValue
    self.email = json["email"].stringValue
    self.avatar_url = json["avatar_url"].stringValue
    self.url = json["url"].stringValue
  }
}

//struct Users : JSONJoy {
//  var users: Array<User>!
//  
//  init() {}
//  
//  init(_ decoder: JSONDecoder) {
////    decoder.array(&users)
//    if let array = decoder["users"].array {
//      users = Array<User>()
//      for user in array {
//        users.append(User(user))
//      }
//    }
//  }
//}
//
//struct User : JSONJoy {
//  var id: Int?
//  var name: String?
//  var email: String?
//  var avatar_url: String?
//  var url: String?
//  
//  init() {}
//  
//  init(_ decoder: JSONDecoder) {
//    id = decoder["id"].integer
//    name = decoder["name"].string
//    email = decoder["email"].string
//    avatar_url = decoder["avatar_url"].string
//    url = decoder["url"].string
//  }
//}