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
  
  var token: String {
    get {
      return defaults.stringForKey("token")!
    }
    set {
      self.set("token", value: newValue)
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
