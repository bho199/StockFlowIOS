//
//  HomeeViewController.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 30/03/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class HomeeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var OurHomeCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeeCollectionViewCell
        
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON {response in
                
            let allData = JSON(response.result.value!)
            cell.n1name.text = "\(allData[indexPath.row]["name"].stringValue)"
            cell.n1value.text = "$ \(allData[indexPath.row]["price_usd"].stringValue)"
            cell.gap24h.text = "24h \(allData[indexPath.row]["percent_change_24h"].stringValue)%"
            
            switch allData[indexPath.row]["symbol"].stringValue {
            case "BTC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1.png"))
            case "ETH":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1027.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1027.png"))
            case "XRP":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/52.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/52.png"))
            case "BCH":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1831.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1831.png"))
            case "LTC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2.png"))
            case "EOS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1765.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1765.png"))
            case "ADA":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2010.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2010.png"))
            case "XLM":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/512.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/512.png"))
            case "NEO":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1376.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1376.png"))
            case "XMR":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/328.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/328.png"))
            case "MIOTA":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1720.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1720.png"))
            case "DASH":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/131.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/131.png"))
            case "USDT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/825.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/825.png"))
            case "XEM":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/873.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/873.png"))
            case "TRX":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1958.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1958.png"))
            case "BNB":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1839.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1839.png"))
            case "ETC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1321.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1321.png"))
            case "VEN":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1904.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1904.png"))
            case "QTUM":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1684.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1684.png"))
            case "XVG":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/693.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/693.png"))
            case "LSK":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1214.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1214.png"))
            case "OMG":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1808.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1808.png"))
            case "ICX":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2099.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2099.png"))
            case "NANO":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1567.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1567.png"))
            case "BTG":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2083.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2083.png"))
            case "ZEC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1437.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1437.png"))
            case "ONT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2566.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2566.png"))
            case "STEEM":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1230.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1230.png"))
            case "BTM":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1866.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1866.png"))
            case "PPT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1789.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1789.png"))
            case "DGD":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1229.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1229.png"))
            case "BCN":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/372.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/372.png"))
            case "SC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1042.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1042.png"))
            case "BTS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/463.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/463.png"))
            case "WAVES":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1274.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1274.png"))
            case "STRAT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1343.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1343.png"))
            case "BTS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/363.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/363.png"))
            case "SNT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1759.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1759.png"))
            case "RHOC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2021.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2021.png"))
            case "AE":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1700.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1700.png"))
            case "DOGE":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/74.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/74.png"))
            case "BCD":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2222.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2222.png"))
            case "MKR":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1518.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1518.png"))
            case "DCR":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1168.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1168.png"))
            case "ARDR":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1320.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1320.png"))
            case "ZRX":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1896.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1896.png"))
            case "KMD":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1521.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1521.png"))
            case "ZIL":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2469.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2469.png"))
            case "REP":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1104.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1104.png"))
            case "IOST":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2405.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2405.png"))
            case "WTC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1925.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1925.png"))
            case "AION":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2062.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2062.png"))
            case "HSR":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1903.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1903.png"))
            case "VERI":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1710.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1710.png"))
            case "ARK":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1586.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1586.png"))
            case "PIVX":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1169.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1169.png"))
            case "LRC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1934.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1934.png"))
            case "KCS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2087.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2087.png"))
            case "CNX":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2027.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2027.png"))
            case "QASH":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2213.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2213.png"))
            case "BAT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1697.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1697.png"))
            case "DGB":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/109.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/109.png"))
            case "MONA":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/213.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/213.png"))
            case "DRGN":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2243.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2243.png"))
            case "FCT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1087.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1087.png"))
            case "GNT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1455.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1455.png"))
            case "NAS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1908.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1908.png"))
            case "GXS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1750.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1750.png"))
            case "GAS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1785.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1785.png"))
            case "ETOS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1817.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1817.png"))
            case "SYS":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/541.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/541.png"))
            case "R":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2135.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2135.png"))
            case "FUN":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1757.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1757.png"))
            case "ETN":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2137.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2137.png"))
            case "ELF":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2299.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2299.png"))
            case "XZC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1414.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1414.png"))
            case "KNC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1982.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1982.png"))
            case "KIN":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1993.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1993.png"))
            case "RDD":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/118.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/118.png"))
            case "STORM":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2297.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2297.png"))
            case "SUB":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1984.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1984.png"))
            case "POWR":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2132.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2132.png"))
            case "SALT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1996.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1996.png"))
            case "NXT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/66.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/66.png"))
            case "DENT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1886.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1886.png"))
            case "MAID":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/291.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/291.png"))
            case "GBYTE":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1492.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1492.png"))
            case "NCASH":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2544.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2544.png"))
            case "STORJ":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1772.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1772.png"))
            case "ENG":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2044.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2044.png"))
            case "MITH":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2608.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2608.png"))
            case "SKY":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1619.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1619.png"))
            case "DCN":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1876.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1876.png"))
            case "REQ":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2071.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2071.png"))
            case "BNT":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1727.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1727.png"))
            case "CND":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2043.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2043.png"))
            case "LINK":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1975.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1975.png"))
            case "NEBL":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1955.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1955.png"))
            case "WAX":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/2300.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/2300.png"))
            case "EMC":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/558.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/558.png"))
            case "PAY":
                cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1758.png"))
                cell.n1logo.sd_setImage(with: URL(string:"https://s2.coinmarketcap.com/static/img/coins/16x16/1758.png"))
            
            
            default:
            cell.n1image.sd_setImage(with: URL(string: "https://s2.coinmarketcap.com/generated/sparklines/web/7d/usd/1.png"))
            }
            
            
        }
        
        cell.n1image.layer.borderColor = UIColor.black.cgColor
        cell.n1image.layer.borderWidth = 0
        
        cell.shadowOfTheColossus.layer.borderWidth = 0
        cell.shadowOfTheColossus.layer.borderColor = UIColor.black.cgColor
        cell.shadowOfTheColossus.layer.cornerRadius = 13
        return cell
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
