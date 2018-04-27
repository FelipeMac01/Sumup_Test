//
//  Merchant_profile.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Merchant_profile {
    
    var merchant_code : String?
    var business_name : String?
    var email : String?
    var address : Address?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["merchant_code"] as? String? {
            merchant_code = value
        }
        
        if let value = dictionary["business_name"] as? String? {
            business_name = value
        }
        
        if let value = dictionary["email"] as? String? {
            email = value
        }
        
        if let value = dictionary["address"] as? [String: AnyObject] {
            address = Address(dictionary: value)
        }
    }
}
