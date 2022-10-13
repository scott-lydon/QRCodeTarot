//
//  Suit.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/3/22.
//

import Foundation

enum Suit: String, Codable, CaseIterable, Comparable {
    
    case cups
    case pentacles
    case swords
    case wands

    var symbol: CardKey.Symbol {
        .init(suit: self)
    }
    
    static func < (lhs: Suit, rhs: Suit) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
