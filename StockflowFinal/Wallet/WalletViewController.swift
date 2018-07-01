//
//  WalletViewController.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 07/05/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WalletViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var walletTotalValue: UILabel!
    @IBOutlet weak var walletTotalChange: UILabel!
    @IBOutlet weak var cv: UICollectionView!
    var allData = JSON()
    var data = JSON()
    var walletVal:Float = 0.0
    var walletCha:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walletVal = 0
        walletCha = 0
        
        
        let walletParameters:Parameters = [
            "user_id" : UserDefaults.standard.integer(forKey: "userId")
        ]
        
        Alamofire.request("http://stockflow.test/api/wallet", method: .post, parameters: walletParameters).responseJSON {response in
            self.allData = JSON(response.result.value!)
            self.cv.reloadData()
            
            JsonManager.sharedInstance.manager.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON {response in
                
                self.data = JSON(response.result.value!)
                self.cv.reloadData()
                var indexp = 0
                for (_, crypto) in self.allData {
                    indexp = self.findValue(name: crypto["name"].stringValue)
                    self.walletVal += self.data[indexp]["price_usd"].floatValue * crypto["quantity"].floatValue
                    self.walletCha += crypto["value"].floatValue
                }
                self.walletTotalValue.text = "$ \(self.walletVal)"
                self.walletTotalChange.text = "\(((self.walletVal / self.walletCha) - 1) * 100) %"
                
                // Do any additional setup after loading the view.
                if ((((self.walletVal / self.walletCha) - 1) * 100) >= 0) {
                    self.walletTotalChange.textColor = UIColor.green
                } else {
                    self.walletTotalChange.textColor = UIColor.red
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allData.count
    }
    
    func findValue(name: String) ->Int{
        for (index, subJson):(String, JSON) in data {
            if (subJson["name"].stringValue == name) {
                return Int(index)!
            }
        }
        return -1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let walletCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "walletCell", for: indexPath) as! WalletCollectionViewCell)
        let cryptoIndex = findValue(name: allData[indexPath.row]["name"].stringValue)
        walletCell.walletCrypto.text = "\(allData[indexPath.row]["name"].stringValue)"
        walletCell.walletBuyValue.text = "$ \(allData[indexPath.row]["value"].floatValue)"
        //walletCell.walletBuyTime.text = "\(allData[indexPath.row]["created_at"].stringValue)"
        walletCell.walletQuantity.text = "\(allData[indexPath.row]["quantity"].floatValue)"
        walletCell.walletChange.text = "\(data[cryptoIndex]["price_usd"].floatValue / (allData[indexPath.row]["value"].floatValue / allData[indexPath.row]["quantity"].floatValue) * 100 - 100) %"
        if ((data[cryptoIndex]["price_usd"].floatValue / (allData[indexPath.row]["value"].floatValue / allData[indexPath.row]["quantity"].floatValue) * 100 - 100) >= 0) {
            walletCell.walletChange.textColor = UIColor.green
        } else {
            walletCell.walletChange.textColor = UIColor.red
        }
//        print(data[cryptoIndex]["price_usd"].floatValue) 8317.62
//        print(allData[indexPath.row]["value"].floatValue) 5     832,459251
//        print(allData[indexPath.row]["quantity"].floatValue) 0.0060063
        walletCell.walletActualValue.text = "$ \(data[cryptoIndex]["price_usd"].floatValue * allData[indexPath.row]["quantity"].floatValue)"
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy HH:mm"
        
        if let date = dateFormatterGet.date(from: "\(allData[indexPath.row]["created_at"].stringValue)"){
            walletCell.walletBuyTime.text = dateFormatterPrint.string(from: date)
        }
        
        walletCell.walletView.layer.borderWidth = 0
        walletCell.walletView.layer.borderColor = UIColor.black.cgColor
        walletCell.walletView.layer.cornerRadius = 13
        return walletCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Do you want to sell this?", message: "", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            (_) in
            print("Cancel Pressed")
        }
        
        let confirmAction = UIAlertAction(title: "Sell", style: UIAlertActionStyle.default) { (_) in
            print(self.allData[indexPath.row]["id"].stringValue)
            let parameters:Parameters = [
                "id" : self.allData[indexPath.row]["id"].stringValue,
                ]
            
            Alamofire.request("http://stockflow.test/api/sell", method: .post, parameters: parameters).responseJSON {response in
                let sellController = UIAlertController(title: "Transaction Removed", message: "You Sold Your Cryptos", preferredStyle: .alert)
                let sellAction = UIAlertAction(title: "Done", style: UIAlertActionStyle.default) { (_) in
                    self.viewDidLoad()
                    collectionView.reloadData()
                }
                sellController.addAction(sellAction)
                self.present(sellController, animated: true, completion: nil)
                
            }
        }
        
        //adding the action to dialogbox        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
        let loginPage: ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginPage") as! ViewController
        let logoutController = UIAlertController(title: "Logout", message: "Are you sure?", preferredStyle: .alert)
        let logoutConfirmed = UIAlertAction(title: "Continue", style: UIAlertActionStyle.default) {
            (_) in
            self.present(loginPage, animated: true, completion: nil)
        }
        let logoutCancelled = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            (_) in
            print("cancel")
        }
        logoutController.addAction(logoutConfirmed)
        logoutController.addAction(logoutCancelled)
        self.present(logoutController, animated: true, completion: nil)
    }
}
