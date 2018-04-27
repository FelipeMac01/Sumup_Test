//
//  DetailViewController.swift
//  ApplePaySwag
//
//  Created by Erik.Kerber on 10/17/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//  Please see ATTRIBUTION.md for details.
//

import UIKit
import SumUpSDK
import Alamofire

class BuySwagViewController: UIViewController {

    @IBOutlet weak var swagPriceLabel: UILabel!
    @IBOutlet weak var swagTitleLabel: UILabel!
    @IBOutlet weak var swagImage: UIImageView!
    @IBOutlet weak var applePayButton: UIButton!
    
//    Email: dev_mxg9pakp@sumup.com, Password: extdev
//    var merchantCode = "MXG9PAKP"
//    var transactionCode = "TE497CLQVK"
    
    var merchantCode = String()
    var transactionCode = String()
    
    var swag: Swag! {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {

        if (!self.isViewLoaded) {
            return
        }
        
        self.title = swag.title
        self.swagPriceLabel.text = "$" + swag.priceString
        self.swagImage.image = swag.image
        self.swagTitleLabel.text = swag.description
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup of APIKey
        DispatchQueue.main.async {
            SumUpSDK.setup(withAPIKey: "09c0c1fd-36b0-4fe3-9387-c4fab3b5741d")
        }
        self.configureView()
    }
    
    @IBAction func purchase(_ sender: UIButton) {
        
        //Check if the merchant is already logued, if not show the login page, will start the checkout process.
        if !SumUpSDK.isLoggedIn {
            SumUpSDK.presentLogin(from: self, animated: true, completionBlock: nil)
        } else {
            SumUpSDK.presentCheckoutPreferences(from: self, animated: true, completion: { (success, error) in
                if let request = self.getCheckoutRequest() {
                    self.makeCheckout(with: request)
                }
            })
        }
    }
    
    func getCheckoutRequest() -> CheckoutRequest? {
        if let currencyCode = SumUpSDK.currentMerchant?.currencyCode {
            return CheckoutRequest(total: swag.price, title: swag.title, currencyCode: currencyCode)
        }else{
            let alert = UIAlertController(title: "SumUp", message: "Ops, Something went wrong, try again later", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            }))
            self.present(alert, animated: true, completion: nil)
        }
        return nil
    }
    
    func makeCheckout(with request: CheckoutRequest) {
        
        SumUpSDK.checkout(with: request, from: self, completion: { (result, error) in
            if let result = result, result.success, let transacCode = result.transactionCode {
                print("Purchase complete: ID \(transacCode)")
                self.transactionCode = transacCode
                
                if let merchantCode = SumUpSDK.currentMerchant?.merchantCode {
                    print("Merchant code: \(merchantCode)")
                    self.merchantCode = merchantCode
                    self.getReceipt()
                }else{
                    print("\(error.debugDescription)")
                }
            } else {
                print("\(error.debugDescription)")
            }
        })
    }
    
    //Api for Receipt    
    func getReceipt() {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        
        manager.request("https://receipts-ng.sumup.com/v0.1/receipts/\(transactionCode)?mid=\(merchantCode)", method: .get).responseJSON { response in
            
            switch (response.result) {
            case .success:

                if let jsonDict = response.result.value as? [String:AnyObject] {
                
                    let receipt = Receipt(dictionary: jsonDict)
                    
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "receiptVC") as? ReceiptSwagViewController {
                        
                        vc.receipt = receipt
                        
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }else{
                    let alert = UIAlertController(title: nil, message: "Something went wrong. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                        self.view.isUserInteractionEnabled = true
                    }
                    alert.addAction(OKAction)
                    
                    self.present(alert, animated: true, completion: nil)
                }
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}

