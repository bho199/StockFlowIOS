//
//  ViewController.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 21/03/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var noAccount: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var stockTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stockTitle.textColor = UIColor.white
        
        usernameText.borderStyle = UITextBorderStyle.roundedRect
        usernameText.keyboardType = UIKeyboardType.asciiCapableNumberPad
        
        passwordText.borderStyle = UITextBorderStyle.roundedRect
        passwordText.keyboardType = UIKeyboardType.asciiCapableNumberPad
        
        login.backgroundColor = UIColor.gray
        login.setTitleColor (UIColor.white, for: .normal)
        //login.addTarget(self, action: #selector(home), for: .touchUpInside)
        
        noAccount.setTitleColor (UIColor.white, for: .normal)
        
        register.setTitle("Registrati qui", for: .normal)
        register.setTitleColor (UIColor.white, for: .normal)
        
        self.view.addSubview(register)
        self.view.addSubview(login)
        self.view.addSubview(usernameText)
        self.view.addSubview(passwordText)
        self.view.addSubview(stockTitle)
        self.view.addSubview(noAccount)
        self.view.backgroundColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

