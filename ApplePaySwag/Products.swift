//
//  Products.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Products {
    
    var name : String?
    var price : String?
    var quantity : Int?
    var total_price : String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["name"] as? String? {
            name = value
        }
        
        if let value = dictionary["price"] as? String? {
            price = value
        }
        
        if let value = dictionary["quantity"] as? Int? {
            quantity = value
        }
        
        if let value = dictionary["total_price"] as? String? {
            total_price = value
        }
    }
}
