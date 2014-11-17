//
//  UserDefaults.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 11/10/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation

class UserDefaults {
  let defaults = NSUserDefaults.standardUserDefaults()
  
  var api_token: String {
    get {
      return self.get("api_token") as String
    }
    set(value) {
      self.set("api_token", value: value)
    }
  }
  
  func get(key: String) -> AnyObject {
    return defaults.objectForKey(key)!
  }
  
  func set(key: String, value: AnyObject) {
    defaults.setObject(value, forKey: key)
    defaults.synchronize()
  }
}
