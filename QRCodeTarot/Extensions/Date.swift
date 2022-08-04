//
//  Date.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 8/4/22.
//

import Foundation

extension Date {
    /// time returns a Decimal for which the integer represents the hours from 1 to 24 and the decimal value represents the minutes.
    func time(using calendar: Calendar = .current) -> Decimal {
        calendar.component(.hour, from: self).decimal + calendar.component(.minute, from: self).decimal / 100
    }

    var greeting: String {
        let thisTime =  time()
        if thisTime >= 2 && thisTime < 12 {
            return "Good Morning"
        } else if thisTime >= 12 && thisTime < 18 {
            return "Good Afternoon"
        } else {
            return "Good Evening"
        }
    }
}
