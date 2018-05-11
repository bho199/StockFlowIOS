//
//  ViewController.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 21/03/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var noAccount: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var stockTitle: UILabel!
    
    var username = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "IsUserLoggedIn") == true{
            let vc2: HomeeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeeViewController") as! HomeeViewController
            self.present(vc2, animated: false, completion: nil)
        }
        
        stockTitle.textColor = UIColor.white
        
        usernameText.borderStyle = UITextBorderStyle.roundedRect
        usernameText.keyboardType = UIKeyboardType.asciiCapable
        usernameText.placeholder = "Enter Your Email"
        
        passwordText.borderStyle = UITextBorderStyle.roundedRect
        passwordText.keyboardType = UIKeyboardType.asciiCapable
        passwordText.placeholder = "Enter Your Password"
        
        login.backgroundColor = UIColor.gray
        login.setTitleColor (UIColor.white, for: .normal)
        
        register.setTitle("Registrati qui", for: .normal)
        
        self.view.addSubview(register)
        self.view.addSubview(login)
        self.view.addSubview(usernameText)
        self.view.addSubview(passwordText)
        self.view.addSubview(stockTitle)
        self.view.addSubview(noAccount)
    }
    
    @IBAction func authenticateUser(_ sender: Any) {
        
        let loginParameters:Parameters = [
            //"Accept": "application/json",
            "email" : self.usernameText.text!,
            "password" : self.passwordText.text!
        ]
        
        print(loginParameters)
        
        Alamofire.request("http://stockflow.test/api/users", method: .post, parameters: loginParameters).responseJSON {response in
            let data = JSON(response.result.value!)
            print(data)
            if data[0].isEmpty == false {
                UserDefaults.standard.set(true, forKey: "IsUserLoggedIn")
                UserDefaults.standard.set(data[0]["id"].intValue, forKey: "userId")
                let vc2: HomeeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeeViewController") as! HomeeViewController
                self.present(vc2, animated: true, completion: nil)
            } else {
            }
        }        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

