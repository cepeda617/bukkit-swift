//
//  ListItem.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/11/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class ListItem {
  var id: Int?
  var name: String
  var list_id: Int?
  var created_at: String?
  var updated_at: String?
  var completed: Bool?
  var complete_url: NSURL?
  var url: NSURL?
  
  init(json: JSON) {
    self.id = json["id"].intValue
    self.name = json["name"].stringValue
    self.list_id = json["list_id"].intValue
    self.created_at = json["created_at"].stringValue
    self.updated_at = json["updated_at"].stringValue
    self.completed = json["completed"].boolValue
    self.complete_url = NSURL(string: json["complete_url"].stringValue)
    self.url = NSURL(string: json["url"].stringValue)
  }
  
  init(name: String) {
    self.name = name
  }
}
