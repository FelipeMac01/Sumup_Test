//
//  Acquirer_data.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Acquirer_data {
    
    var tid : String?
    var return_code : String?

    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["tid"] as? String? {
            tid = value
        }
        
        if let value = dictionary["return_code"] as? String? {
            return_code = value
        }
    }
}
