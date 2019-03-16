//
//  NotificationController.swift
//  EmadyTravels WatchKit Extension
//
//  Created by Hiten Patel on 2019-03-13.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet weak var datas: WKInterfaceLabel!
    
    var data = UserDefaults.standard
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("Activae")
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    var seconds = 20.0

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
       
        
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(sendData), userInfo: nil, repeats: true)
        
    }
    
    @objc func sendData() {
        print("----------")
        print("welcome")
        
        //get date from API data
        let date = Date()
        print("Date:\(date)")
        let calendar = Calendar.current
        //get year from date
        let year = calendar.component(.year, from: date)
        //get month
        let month = calendar.component(.month, from: date)
        //get day
        let day = calendar.component(.day, from: date)
        //get hour
        let hour = calendar.component(.hour, from: date)
        //get minute
        let minutes = calendar.component(.minute, from: date)
        //get seconds
        let seconds = calendar.component(.second, from: date)
        
        print("Year\(year),Month:\(month),Day:\(day),hours\(hour),Minutes:\(minutes),Seconds:\(seconds)")
        
        //get current date and time
        
        let date1 = date
        let calendar1 = Calendar.current
        let day1 = calendar1.component(.day, from: date1)
        let year1 = calendar1.component(.year, from: date1)
        let month1 = calendar1.component(.month, from: date1)
        let hour1 = calendar1.component(.hour, from: date1)
        let minutes1 = calendar1.component(.minute, from: date1)
        let seconds1 = calendar.component(.second, from: date1)

        print("Date\(date1), hour\(hour1), minutes\(minutes1)")
        
        //get data from user defaults
        var u = data.string(forKey: "key")!
        
        //checkt duartion between two dates
        let diff = day1 - day
        if(diff == 0) {
            print("Smae date")
            self.datas.setText("BOARD Flight: \(u)")
        } else {
            self.datas.setText("No Flights Booked")
        }
        print("u\(u)")
         print("----------")
    }
}
