//
//  TrendsViewController.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 10/04/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TrendsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
    {
    @IBOutlet weak var trendsCollection: UICollectionView!
    var allData = JSON()
    var arrayData:[JSON] = []
    var walletTotalValue:[String] = []
    var walletTotalChange:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://stockflow.test/api/allUsers").responseJSON {response in
            self.allData = JSON(response.result.value!)
            self.arrayData = self.allData.arrayValue
            self.arrayData = self.arrayData.sorted { $0["gain"].floatValue > $1["gain"].floatValue }
            print(self.arrayData)
            self.trendsCollection.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let trendsCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "trendsCell", for: indexPath) as! TrendsCollectionViewCell)
        trendsCell.trendsUser.text = self.arrayData[indexPath.row]["name"].stringValue
        
        trendsCell.trendsProfit.text = "$ \(round(100 * self.arrayData[indexPath.row]["gain"].floatValue) / 100)"
        trendsCell.trendsChange.text = "\(round(1000 * self.arrayData[indexPath.row]["change"].floatValue) / 1000) %"
        
        if self.arrayData[indexPath.row]["gain"].floatValue <= 0 {
            trendsCell.trendsChange.textColor = .red
            
        } else {
            trendsCell.trendsChange.textColor = .green
        }
        
        if self.arrayData[indexPath.row]["change"].floatValue <= 0 {
            trendsCell.trendsProfit.textColor = .red
            
        } else {
            trendsCell.trendsProfit.textColor = .green
        }
        
        trendsCell.trenView.layer.borderWidth = 0
        trendsCell.trenView.layer.borderColor = UIColor.black.cgColor
        trendsCell.trenView.layer.cornerRadius = 13
        return trendsCell
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
