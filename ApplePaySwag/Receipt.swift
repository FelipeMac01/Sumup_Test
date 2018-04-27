//
//  receipt.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Receipt {
    
    var transaction_data : Transaction_data?
    var merchant_data : Merchant_data?
    var card_application_data : Card_application_data?
    var emv_data : Emv_data?
    var acquirer_data : Acquirer_data?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["transaction_data"] as? [String: AnyObject] {
            transaction_data = Transaction_data(dictionary: value)
        }
        
        if let value = dictionary["merchant_data"] as? [String: AnyObject] {
            merchant_data = Merchant_data(dictionary: value)
        }
        
        if let value = dictionary["card_application_data"] as? [String: AnyObject] {
            card_application_data = Card_application_data(dictionary: value)
        }
        
        if let value = dictionary["emv_data"] as? [String: AnyObject] {
            emv_data = Emv_data(dictionary: value)
        }
        
        if let value = dictionary["acquirer_data"] as? [String: AnyObject] {
            acquirer_data = Acquirer_data(dictionary: value)
        }
    }
}
