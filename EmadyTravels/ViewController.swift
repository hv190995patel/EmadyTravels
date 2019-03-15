//
//  ViewController.swift
//  EmadyTravels
//
//  Created by Hiten Patel on 2019-03-13.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController,WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    //MARK: outlets for the phone UI
    @IBOutlet weak var sourceText: UITextField!
    @IBOutlet weak var destinationText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (WCSession.isSupported()) {
            print("Yes it is!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }

    }
    
    //MARK: aaction for the search button
    @IBAction func searchData(_ sender: UIButton) {
        
        var source = sourceText.text
        print("Source is\(source)")
        var destiantion = destinationText.text
        print("Destination is:\(destiantion)")
        
        
        if (WCSession.default.isReachable) {
            // construct the message you want to send
            // the message is in dictionary
            let message = ["souce": source,"destination": destiantion]
            // send the message to the watch
            WCSession.default.sendMessage(message, replyHandler: nil)
        }

        
    }
    
}

