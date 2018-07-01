//
//  CalendarViewController.swift
//  StockflowFinal
//
//  Created by Alessandro Li Greci on 28/03/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore

class CalendarViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.isUserInteractionEnabled = true
        let jsSource = "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script><script type=\"text/javascript\" src=\"http://www.coincalendar.info/wp-content/plugins/eventon-api/eventon.js?ver=1.0.1\"></script><script type=\"text/javascript\">jQuery(document).ready(function($){$(\'#eventoncontent\').evoCalendar({api: \'http://www.coincalendar.info/wp-json/eventon/calendar?event_type=3,1266,1267&number_of_months=1&event_count=20&show_et_ft_img=yes\',calendar_url: \'\',new_window: true,loading_text: \'Loading Calendar...\'});});</script>"
        let pathname = Bundle.main.path(forResource: "calendar", ofType: "html")
        let url = URL(fileURLWithPath: pathname!)
        let request = URLRequest(url: url)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

