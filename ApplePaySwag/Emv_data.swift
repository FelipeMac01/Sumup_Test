//
//  Emv_data.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Emv_data {
    
    var tvr : String?
    var tsi : String?
    var cvr : String?
    var iad : String?
    var arc : String?
    var act : String?
    var acv : String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["tvr"] as? String? {
            tvr = value
        }
        
        if let value = dictionary["tsi"] as? String? {
            tsi = value
        }
        
        if let value = dictionary["cvr"] as? String? {
            cvr = value
        }
        
        if let value = dictionary["iad"] as? String? {
            iad = value
        }
        
        if let value = dictionary["arc"] as? String? {
            arc = value
        }
        
        if let value = dictionary["act"] as? String? {
            act = value
        }
        
        if let value = dictionary["acv"] as? String? {
            acv = value
        }
    }
}
