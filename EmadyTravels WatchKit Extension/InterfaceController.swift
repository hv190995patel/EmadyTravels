//
//  InterfaceController.swift
//  EmadyTravels WatchKit Extension
//
//  Created by Hiten Patel on 2019-03-13.
//  Copyright © 2019 MacStudent. All rights reserved.

import WatchKit
import Foundation
import SwiftyJSON
import Alamofire

class InterfaceController: WKInterfaceController {
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    
    var List:[[String:String]] = []
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        super.willActivate()
        
       
        Alamofire.request("http://5c8bb1eca0bb650014f03b6b.mockapi.io/api/v1/data")
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
