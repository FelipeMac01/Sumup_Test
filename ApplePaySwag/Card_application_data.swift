//
//  Card_application_data.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Card_application_data {
    
    var name : String?
    var aid : String?
    
    init(dictionary: [String: AnyObject]) {
       
        if let value = dictionary["name"] as? String? {
            name = value
        }
        
        if let value = dictionary["aid"] as? String? {
            aid = value
        }
    }
}
