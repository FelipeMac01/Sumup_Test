//
//  Merchant_data.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Merchant_data {
    
    var merchant_profile : Merchant_profile?
    var locale : String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["merchant_profile"] as? [String: AnyObject] {
            merchant_profile = Merchant_profile(dictionary: value)
        }
        
        if let value = dictionary["locale"] as? String? {
            locale = value
        }
    }
}
