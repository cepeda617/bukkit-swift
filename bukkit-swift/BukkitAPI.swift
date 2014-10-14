//
//  BukkitAPI.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/12/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation
import Alamofire

class BukkitAPI {
  let base_url = "http://localhost:3000/api/v1"
  
  var default_headers: Dictionary<NSObject, AnyObject> {
    get {
      var headers = Alamofire.Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
      headers["authorization"] = "Token token=97507b3209a119d52cc289c6c1b187e2"
      return headers
    }
  }
  
  var configuration: NSURLSessionConfiguration {
    get {
      let config = NSURLSessionConfiguration.defaultSessionConfiguration()
      config.HTTPAdditionalHeaders = default_headers
      return config
    }
  }
  
  var manager: Manager {
    get {
      return Alamofire.Manager(configuration: configuration)
    }
  }
}







//import SwiftHTTP

//class API {
//  var request = HTTPTask()
//
//  init() {
//    request.baseURL = "http://localhost:3000/api/v1"
//    request.requestSerializer = JSONRequestSerializer()
//    request.requestSerializer.headers["authorization"] = "Token token=97507b3209a119d52cc289c6c1b187e2"
//    request.responseSerializer = JSONResponseSerializer()
//  }
//
//  func get(_ :String, parameters:
//  request.GET("http://vluxe.io", parameters: nil, success: {(response: HTTPResponse) in
//    if response.responseObject != nil {
//    let data = response.responseObject as NSData
//    let str = NSString(data: data, encoding: NSUTF8StringEncoding)
//    println("response: \(str)") //prints the HTML of the page
//    }
//    },failure: {(error: NSError) in
//    println("error: \(error)")
//  })
//  let session = NSURLSession.sharedSession()
//  var url = URL()
//  var data: NSData?
//  var response: NSURLResponse?
//  var error: NSError?
//  
//  func get(path:String = "", query:Dictionary<String, String> = [:]) -> String {
//    self.url = URL(path: path, query: query)
//    
//    session.dataTaskWithURL(url.to_url) { (data, response, error) in
//      (self.data, self.response, self.error) = (data, response, error)
//    }.resume()
//    
//    return json
//  }
//  
//  var json: String {
//    get {
//      return NSString(data: data!, encoding: NSUTF8StringEncoding)
//    }
//  }
//}