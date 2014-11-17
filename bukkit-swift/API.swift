//
//  API.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 11/16/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class API {
  init() {
    
  }
  
  class func lists(callback: ([List]) -> Void) {
    Alamofire.request(Router.Lists()).responseJSON { (request, response, json, error) in
      var lists = [List]()
      for (index: String, subJson: JSON) in JSON(json!) {
        lists.append(List(json: subJson))
      }
      callback(lists)
    }
  }
}