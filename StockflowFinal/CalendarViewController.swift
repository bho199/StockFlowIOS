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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

