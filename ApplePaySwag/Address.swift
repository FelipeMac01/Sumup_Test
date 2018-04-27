//
//  Address.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Address {
    
    var address_line1 : String?
    var city : String?
    var country : Int?
    var country_native_name : String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["address_line1"] as? String? {
            address_line1 = value
        }
        
        if let value = dictionary["city"] as? String? {
            city = value
        }
        
        if let value = dictionary["country"] as? Int? {
            country = value
        }
        
        if let value = dictionary["country_native_name"] as? String? {
            country_native_name = value
        }
    }
}
