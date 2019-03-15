//
//  InterfaceController.swift
//  EmadyTravels WatchKit Extension
//
//  Created by Hiten Patel on 2019-03-13.
//  Copyright © 2019 MacStudent. All rights reserved.

import WatchKit
import Foundation
import WatchConnectivity
import SwiftyJSON
import Alamofire

class InterfaceController: WKInterfaceController {
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        super.willActivate()
        
        
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key":"d8948007bemsh6d460981203de1dp1632d4jsn1b6202a78279"
        ]
      
        
        Alamofire.request("https://siddiq-such-flight-v1.p.rapidapi.com/search?return-date=2019-04-07&to=LHE&depart-date=2019-03-31&from=DXB", headers: headers)
            .responseJSON {
            // 1. store the data from the internet in the
            // response variable
            response in
                print(response.result)
                 print("----------")
            
            // 2. get the data out of the variable
            guard let apiData = response.result.value else {
                print("Error getting data from the URL")
                return
            }
                print("APIDATA\(apiData)")
               
             
           
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
