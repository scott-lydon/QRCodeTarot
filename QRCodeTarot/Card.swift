//
//  Card.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import Foundation

struct Card: Codable {
    let symbol: Symbol
    let number: Int
    let deckVersion: Int
}

extension Card {

    enum Symbol: String, Codable {
        case hearts
        case clubs
        case spades
        case diamonds
    }
}
