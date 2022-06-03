//
//  Int.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 5/6/22.
//

import Foundation

extension Int {

    var decimal: Decimal {
        Decimal(self)
    }

    var leadingZero: String {
        String(format: "%02d", self)
    }

    var tarotNumberSpelledOut: String {
        switch self {
        case 1: return  "Ace"
        case 11: return "Knight"
        case 12: return "Jack"
        case 13: return "Queen"
        case 14: return "King"
        default:
            let formatter = NumberFormatter()
            formatter.numberStyle = .spellOut
            if let string = formatter.string(from: NSNumber(value: self)) {
                return string
            }
            assertionFailure()
            return "-1"
        }
    }
}
