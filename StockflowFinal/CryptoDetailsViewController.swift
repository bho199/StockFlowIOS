//
//  CryptoDetailsViewController.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 05/04/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class CryptoDetailsViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var price:Float = 0
    
    @IBAction func buyButton(_ sender: Any) {
        showInputDialogue()
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    @IBOutlet weak var nameDetail: UILabel!
    @IBOutlet weak var rankDetail: UILabel!
    @IBOutlet weak var priceDetail: UILabel!
    @IBOutlet weak var symbolDetail: UILabel!
    @IBOutlet weak var marketCapDetail: UILabel!
    @IBOutlet weak var volume24hDetail: UILabel!
    @IBOutlet weak var availableSupplyDetail: UILabel!
    @IBOutlet weak var totalSupplyDetail: UILabel!
    @IBOutlet weak var change1hDetail: UILabel!
    @IBOutlet weak var change24hDetail: UILabel!
    @IBOutlet weak var change7gDetail: UILabel!
    @IBOutlet weak var backPage: UIButton!
    @IBOutlet weak var imgGraph: UIImageView!
    var imgCount:String = ""
    var cryptoRank = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON {response in
            
            let allData = JSON(response.result.value!)

            self.symbolDetail.text = "\(allData[self.cryptoRank]["symbol"].stringValue)"
            self.nameDetail.text = "\(allData[self.cryptoRank]["name"].stringValue)"
            self.rankDetail.text = "\(allData[self.cryptoRank]["rank"].stringValue)"
            self.priceDetail.text = "$ \(allData[self.cryptoRank]["price_usd"].stringValue)"
            self.marketCapDetail.text = "Market Cap: \(allData[self.cryptoRank]["market_cap_usd"].stringValue)"
            self.volume24hDetail.text = " 24h Volume: \(allData[self.cryptoRank]["24h_volume_usd"].stringValue)"
            self.availableSupplyDetail.text = "Available Supply: \(allData[self.cryptoRank]["available_supply"].stringValue)"
            self.totalSupplyDetail.text = "Total Supply: \(allData[self.cryptoRank]["total_supply"].stringValue)"
            self.change1hDetail.text = "1h Change: \(allData[self.cryptoRank]["percent_change_1h"].stringValue)%"
            self.change24hDetail.text = "24h Change: \(allData[self.cryptoRank]["percent_change_24h"].stringValue)%"
            self.change7gDetail.text = "7d Change: \(allData[self.cryptoRank]["percent_change_7d"].stringValue)%"
        }
        
        Alamofire.request("https://api.coinmarketcap.com/v2/ticker/?structure=array").responseJSON {response in
            let v2data = JSON(response.result.value!)
            self.imgCount = v2data["data"][self.cryptoRank]["id"].stringValue
            self.imgGraph.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/" + self.imgCount + ".png"))
        }
        print(self.imgCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showInputDialogue() {
        let alertController = UIAlertController(title: "Enter Amount", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Money Amount"
            textField.keyboardType = .numberPad
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            (_) in
            print("Cancel Pressed")
        }
        
        let confirmAction = UIAlertAction(title: "Buy", style: UIAlertActionStyle.default) { (_) in
            print(alertController.textFields![0].text!)
            
            Alamofire.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON {response in
                let allData = JSON(response.result.value!)
                self.price = allData[self.cryptoRank]["price_usd"].floatValue
                
                response.result.ifSuccess {
                    
                    let parameters:Parameters = [
                        "name" : self.nameDetail.text!,
                        "quantity" : Float(alertController.textFields![0].text!)! / self.price,
                        "value" : alertController.textFields![0].text!,
                        "value_now" : self.price,
                        "user_id" : UserDefaults.standard.integer(forKey: "userId")
                    ]
                    
                    Alamofire.request("http://stockflow.test/api/crypto", method: .post, parameters: parameters).responseJSON {response in
                        let _ = JSON(response.result.value!)
                    }
                    let successController = UIAlertController(title: "Transaction completed", message: "Your Cryptos Are In Your Wallet Now", preferredStyle: .alert)
                    
                    let transactionConfirmed = UIAlertAction(title: "Continue", style: UIAlertActionStyle.default) {
                        (_) in
                        print("success")
                    }
                    successController.addAction(transactionConfirmed)
                    self.present(successController, animated: true, completion: nil)
                }
            }
        }
    
        //adding the action to dialogbox
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
}
