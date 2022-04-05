//
//  CardKey.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/4/22.
//

import Foundation

/// Used to map to the correct card until we customize the api with the correct types.
/// When that happens the symbols should be swapped out with the suit used below.
struct CardKey: Codable {
    let symbol: Symbol
    let number: Int
    let deckVersion: Int
}

extension CardKey {

    enum Symbol: String, Codable {
        case hearts
        case clubs
        case spades
        case diamonds

        var suit: Suit {
            switch self {
            case .hearts: return .cups
            case .clubs: return .wands
            case .spades: return .swords
            case .diamonds: return .pentacles
            }
        }
    }
}
