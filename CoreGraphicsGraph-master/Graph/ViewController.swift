//
//  ViewController.swift
//  Graph
//
//  Created by Tim Davies on 11/08/2014.
//  Copyright (c) 2014 Tim Davies. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
                            
    @IBOutlet weak var PercentChange24: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var LastUpdate: UILabel!
    @IBOutlet weak var value: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let x: CGFloat = 10
        let y: CGFloat = 50
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        
        
        
        
        
        
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/bitcoin") .responseJSON { response in
            print(response.result as Any)
            print(response.response as Any)
            print(response.result.value as Any)
        
            let data = response.result.value
            let json = JSON(data!)
            print(json["data"])
            let valore = "\(json[0]["price_usd"])"
            let numero = (valore as NSString).integerValue
//            var gameTimer: Timer!
//            gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)

            
            var myData = [
                ["Mon": numero],
                ["Tues" : 80],
                ["Weds" : 70],
                ["Thurs" : 65],
                ["Fri" : 30],
                ["Sat" : 15],
                ["Sun": 45]
            ]
            var i = 0
//           per ogni tot secondi crei una sfera i più
//            appendere un nuovo dato in un numero di tempo
            func runTimedCode(){
                myData.append(["domani\(i)" :23898+i])
            } 

            var gameTimer: Timer!
            gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(runTimedCode()), userInfo: nil, repeats: true)
            //            var i = 0

            

            let graph = GraphView(frame: CGRect(x: x, y: y, width: width-x*2, height: height * 0.5), data: myData as! [[String : Int]])
            self.view.addSubview(graph)
            print(myData)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

