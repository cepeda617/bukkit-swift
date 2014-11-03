//
//  Router.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/14/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
  static let baseURLString = "http://localhost:3000/api/v1"
  static let OAuthToken: String? = "97507b3209a119d52cc289c6c1b187e2"
  
  case Users()
  case CreateUser([String: AnyObject])
  case ReadUser(String)
  case UpdateUser(String, [String: AnyObject])
  case DestroyUser(String)
  
  case Lists()
  case CreateList([String: AnyObject])
  case ReadList(String)
  case UpdateList(String, [String: AnyObject])
  case DestroyList(String)
  
  var method: Alamofire.Method {
    switch self {
    case .Users: return .GET
    case .CreateUser: return .POST
    case .ReadUser: return .GET
    case .UpdateUser: return .PUT
    case .DestroyUser: return .DELETE
      
    case .Lists: return .GET
    case .CreateList: return .POST
    case .ReadList: return .GET
    case .UpdateList: return .PUT
    case .DestroyList: return .DELETE
    }
  }
  
  var path: String {
    switch self {
    case .Users: return "/users"
    case .CreateUser: return "/users"
    case .ReadUser(let id): return "/users/\(id)"
    case .UpdateUser(let id, _): return "/users/\(id)"
    case .DestroyUser(let id): return "/users/\(id)"
      
    case .Lists: return "/lists"
    case .CreateList: return "/lists"
    case .ReadList(let id): return "/lists/\(id)"
    case .UpdateList(let id, _): return "/lists/\(id)"
    case .DestroyList(let id): return "/lists/\(id)"
    }
  }
  
  // MARK: URLRequestConvertible
  
  var URLRequest: NSURLRequest {
    let URL = NSURL(string: Router.baseURLString)
      let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
      mutableURLRequest.HTTPMethod = method.toRaw()
      
      if let token = Router.OAuthToken {
        mutableURLRequest.setValue("Token token=\(token)", forHTTPHeaderField: "authorization")
      }
      
      switch self {
      case .CreateUser(let parameters):
        return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
      case .UpdateUser(_, let parameters):
        return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
      default:
        return mutableURLRequest
      }
  }
}