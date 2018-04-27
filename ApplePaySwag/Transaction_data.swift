//
//  Transaction_data.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 25/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

class Transaction_data {
    
    var transaction_code : String?
    var amount : String?
    var vat_amount : String?
    var tip_amount : String?
    var fee_amount : String?
    var currency : String?
    var timestamp : String?
    var status : String?
    var payment_type : String?
    var entry_mode : String?
    var verification_method : String?
    var card_reader : Card_reader?
    var card : Card?
    var installments_count : Int?
    var process_as : String?
    var products = [Products]()
    var vat_rates = [Vat_rates]()
    var location : Location?
    var events : [Events]?
    var receipt_no : String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let value = dictionary["transaction_code"] as? String? {
            transaction_code = value
        }
        
        if let value = dictionary["amount"] as? String? {
            amount = value
        }
        
        if let value = dictionary["vat_amount"] as? String? {
            vat_amount = value
        }
        
        if let value = dictionary["tip_amount"] as? String? {
            tip_amount = value
        }
        
        if let value = dictionary["fee_amount"] as? String? {
            fee_amount = value
        }
        
        if let value = dictionary["currency"] as? String? {
            currency = value
        }
        
        if let value = dictionary["timestamp"] as? String? {
            timestamp = value
        }
        
        if let value = dictionary["status"] as? String? {
            status = value
        }
        
        if let value = dictionary["payment_type"] as? String? {
            payment_type = value
        }
        
        if let value = dictionary["entry_mode"] as? String? {
            entry_mode = value
        }
        
        if let value = dictionary["verification_method"] as? String? {
            verification_method = value
        }
        
        if let value = dictionary["card_reader"] as? [String: AnyObject] {
            card_reader = Card_reader(dictionary: value)
        }
        
        if let value = dictionary["card"] as? [String: AnyObject] {
            card = Card(dictionary: value)
        }
        
        if let value = dictionary["installments_count"] as? Int? {
            installments_count = value
        }
        
        if let value = dictionary["process_as"] as? String? {
            process_as = value
        }
        
        if let item = dictionary["products"] as? [[String:AnyObject]] {
            
            for value in item {
                
                products.append(Products(dictionary: value))
            }
        }
        
        if let item = dictionary["vat_rates"] as? [[String:AnyObject]] {
            
            for value in item {
                
                vat_rates.append(Vat_rates(dictionary: value))
            }
        }
        
        if let value = dictionary["location"] as? [String: AnyObject] {
            location = Location(dictionary: value)
        }
        
        if let value = dictionary["receipt_no"] as? String? {
            receipt_no = value
        }
    }
}
