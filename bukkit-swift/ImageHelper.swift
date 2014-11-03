//
//  ImageHelper.swift
//  bukkit-swift
//
//  Created by Peter Cepeda on 10/26/14.
//  Copyright (c) 2014 Bukkit. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
  class func downloadImage(url: NSURL, handler: ((image: UIImage, NSError!) -> Void))
  {
    var imageRequest: NSURLRequest = NSURLRequest(URL: url)
    NSURLConnection.sendAsynchronousRequest(imageRequest,
      queue: NSOperationQueue.mainQueue(),
      completionHandler: { response, data, error in
        handler(image: UIImage(data: data), error)
    })
  }
}