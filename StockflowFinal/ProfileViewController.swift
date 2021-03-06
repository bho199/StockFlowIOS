//
//  ProfileViewController.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 10/04/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
        let loginPage: ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginPage") as! ViewController
        self.present(loginPage, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
