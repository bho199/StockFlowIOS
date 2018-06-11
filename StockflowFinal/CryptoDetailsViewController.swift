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
    var cryptoRank = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JsonManager.sharedInstance.manager.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON {response in
            
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showInputDialogue() {
        let alertController = UIAlertController(title: "Enter Amount", message: "", preferredStyle: .alert)
        
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Money Amount"
            textField.keyboardType = .numberPad
        }
    
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Buy", style: .default) { (_) in
            print(alertController.textFields![0].text!)
            
            JsonManager.sharedInstance.manager.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON {response in
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
                    
                    JsonManager.sharedInstance.manager.request("https://stockflow.test/api/crypto", method: .post, parameters: parameters)
                    .validate(statusCode:200..<300)
                    .response {response in
                        print("oke")
                        //let allData = JSON(response.result.value!)
                    }
                }
            }
            
        }
    
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
