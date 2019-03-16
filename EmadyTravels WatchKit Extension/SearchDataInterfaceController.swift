//
//  SearchDataInterfaceController.swift
//  EmadyTravels WatchKit Extension
//
//  Created by Hiten Patel on 2019-03-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class SearchDataInterfaceController: WKInterfaceController,WCSessionDelegate {
    
    
    @IBOutlet weak var SearchTable: WKInterfaceTable!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
       // self.SearchTable.setNumberOfRows(self.countriesList.count, withRowType:"myRow")

    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Play a "click" sound when you get the message
        WKInterfaceDevice().play(.click)
        
        // output a debug message to the terminal
        print("Got a message!")
        
        print(message)
        
        for(key,value) in message{
        
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
