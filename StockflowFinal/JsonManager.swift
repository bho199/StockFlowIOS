//
//  File.swift
//  StockflowFinal
//
//  Created by Giovanni Francolini on 09/06/18.
//  Copyright © 2018 Alessandro Li Greci. All rights reserved.
//

import Foundation
import Alamofire

class JsonManager {
    private init () {}
    static let sharedInstance = JsonManager()
    
    public var manager: Alamofire.SessionManager =
    {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "stockflow.test": .disableEvaluation
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default, serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        
        )
        
        return manager
        }()
}
