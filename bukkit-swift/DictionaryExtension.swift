//
//  DictionaryExtension.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/12/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation

extension Dictionary {
  
  mutating func update(other:Dictionary) {
    for (key,value) in other {
      self.updateValue(value, forKey:key)
    }
  }
  
}