//
//  String.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import Foundation

extension String {

    var tarotNumber: Int {
        switch self {
        case "Ace": return 1
        case "Two": return 2
        case "Three": return 3
        case "Four": return 4
        case "Five": return 5
        case "Six": return 6
        case "Seven": return 7
        case "Eight": return 8
        case "Nine": return 9
        case "Ten": return 10
        case "Knight", "Warrior": return 11
        case "Knave", "Jack", "Servant", "Page", "Slave": return 12
        case "Queen": return 13
        case "King": return 14
        default:
            assertionFailure()
            return -1
        }
    }

    var suit: Suit {
        switch self {
        case "Cups", "Chalices" : return .cups
        case "Pentacles", "Coins", "Disks": return .pentacles
        case "Swords": return .swords
        case "Wands": return .wands
        default:
            assertionFailure(self)
            return .swords
        }
    }

    var autoTarotNum: Int {
        split(separator: " ").first?.string.tarotNumber ?? -1
    }

    var autoSuit: Suit {
        split(separator: " ").map(\.string).third?.suit ?? Suit.swords
    }
}
