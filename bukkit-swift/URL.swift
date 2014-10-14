//
//  url.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/12/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation

let token = "97507b3209a119d52cc289c6c1b187e2"

class URL {
  var scheme = "http"
  var host = "localhost:3000/api/v1"
  var path: String
  var query = ["token": token]
  
  init(path:String = "", query:Dictionary<String, String> = [:]) {
    self.path = path
    self.query.update(query)
  }
  
  var query_parts: [String] {
    get {
      var q = [String]()
      for (name, value) in query {
        q.append("=".join([name, value]))
      }
      return q
    }
  }
  
  var query_string: String {
    get { return "&".join(query_parts) }
  }
  
  var to_url: NSURL {
    get {
      let url = "?".join(["\(scheme)://\(host)/\(path)", query_string])
      return NSURL(string: url)
    }
  }
  
  var to_s: String? {
    get {
      return self.to_url.absoluteString
    }
  }
}