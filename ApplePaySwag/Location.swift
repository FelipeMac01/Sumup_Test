//
//  Location.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Location {
    
    var lat : String?
    var lon : String?
    var horizontal_accuracy : String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["lat"] as? String? {
            lat = value
        }
        
        if let value = dictionary["lon"] as? String? {
            lon = value
        }
        
        if let value = dictionary["horizontal_accuracy"] as? String? {
            horizontal_accuracy = value
        }
    }
}
