//
//  Suit.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/3/22.
//

import Foundation

enum Suit: String, Codable, CaseIterable {
    case cups
    case pentacles
    case swords
    case wands

    var symbol: CardKey.Symbol {
        .init(suit: self)
    }
}
