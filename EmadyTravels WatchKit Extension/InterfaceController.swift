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
    
    var data = UserDefaults.standard
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        super.willActivate()
        data.set("harsh", forKey: "key")
        
        Alamofire.request("https://5c8bb1eca0bb650014f03b6b.mockapi.io/api/v1/data")
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
            let jsonResponse = JSON(apiData)
            print("APIDATA\(jsonResponse)")
         let sunriseTime = jsonResponse["items"]
                
                let x = ["source" : "Armenia"]
                
              print(x["value"])
                for(key,value) in sunriseTime.enumerated()
                {
                    
//                    if(value["source"] == x["source"]) {
//                        print("Success")
//                    }
                     print("sunr\(sunriseTime["source"])")
                    print("Value is\(value),KEY \(key)")
                    
//                    if(value["source"] == x["df"]) {
//
//                    }
                }
                
               
                
                
                
        
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
