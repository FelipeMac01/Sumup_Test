//
//  ReceiptSwagViewController.swift
//  ApplePaySwag
//
//  Created by Felipe Mac on 22/4/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import UIKit

class ReceiptSwagViewController: UIViewController {
    
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var transactionID: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var buyer: UILabel!
    @IBOutlet weak var paymentMethod: UILabel!
    
    var receipt: Receipt! {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    func configureView() {
        
        if (!self.isViewLoaded) {
            return
        }
        
        customerName.text = "Dear \(receipt.merchant_data?.merchant_profile?.business_name ?? "Dear Customer")"
        totalAmount.text = "Total Amount: \(receipt.transaction_data?.amount ?? "Total Amount: ")"
        currency.text = "Currency: \(receipt.transaction_data?.currency ?? "Currency:")"
        transactionID.text = "Transaction ID: \(receipt.transaction_data?.transaction_code ?? "Transaction ID:")"
        
        if let quant = receipt.transaction_data?.products[0].quantity {
            quantity.text = "Quantity: \(String(describing: quant))"
        }
        product.text = "Item/Product: \(receipt.transaction_data?.products[0].name ?? "Item/Product:")"
        buyer.text = "Buyer: \(receipt.transaction_data?.card?.cardholder_name ?? "Buyer:")"
        paymentMethod.text = "Payment Method: \(receipt.transaction_data?.process_as ?? "Payment Method:")"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
