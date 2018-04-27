//
//  Card_reader.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Card_reader {
    
    var code : String?
    var type : String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["code"] as? String? {
            code = value
        }
        
        if let value = dictionary["type"] as? String? {
            type = value
        }
    }
}
