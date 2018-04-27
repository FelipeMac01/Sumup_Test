//
//  Card.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Card {
    
    var last_4_digits : String?
    var type : String?
    var cardholder_name : String?
    var expiry_month : String?
    var expiry_year : String?
    var pan_seq : Int?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["last_4_digits"] as? String? {
            last_4_digits = value
        }
        
        if let value = dictionary["type"] as? String? {
            type = value
        }
        
        if let value = dictionary["cardholder_name"] as? String? {
            cardholder_name = value
        }
        
        if let value = dictionary["expiry_month"] as? String? {
            expiry_month = value
        }
        
        if let value = dictionary["expiry_year"] as? String? {
            expiry_year = value
        }
        
        if let value = dictionary["pan_seq"] as? Int? {
            pan_seq = value
        }
    }
}
