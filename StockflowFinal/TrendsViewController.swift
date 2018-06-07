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

class TrendsViewController: UIViewController //UICollectionViewDelegate, UICollectionViewDataSource
    {
    
    @IBOutlet weak var trendsCollection: UICollectionView!
//    var allData = JSON()
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let trendsParameters:Parameters = [
//            "user_id" : UserDefaults.standard.integer(forKey: "userId")
//        ]
//
//        Alamofire.request("http://stockflow.test/api/wallet", method: .post, parameters: trendsParameters).responseJSON {response in
//            self.allData = JSON(response.result.value!)
//            self.trendsCollection.reloadData()
//        }
//    }
}
