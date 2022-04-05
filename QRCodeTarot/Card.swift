//
//  Card.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import Foundation


// MARK: - Cards
struct Cards: Codable {
    let nhits: Int
    let documentation: String
    let cards: [Card]

    func card(from cardKey: CardKey) -> Card? {
        cards.first { $0.matches(key: cardKey) }
    }

    /// Example: /5/hearts/1 where 5 is the value, hearts is the suit and 1 is the deck version.
    func card(from path: String?) -> Card? {
        guard let paths = path?.components(separatedBy: "/"),
              let value = paths.thirdToLast?.int,
              let suit = paths.secondToLast?.lowercased(),
              let deckVersion = paths.last?.int,
              let symbol = CardKey.Symbol(rawValue: suit) else {
                  return nil
              }
        return card(from: CardKey(symbol: symbol, number: value, deckVersion: deckVersion))
    }
}

// MARK: - Card
struct Card: Codable {
    let type: Importance
    let name_short: String
    let name: String
    let value: String
    let value_int: Int
    let meaning_up: String
    let meaning_rev: String
    let desc: String
    let suit: Suit?

    func matches(key: CardKey) -> Bool {
        suit == key.symbol.suit && key.number == value_int
    }

    enum CodingKeys: String, CodingKey {
        case type
        case name_short
        case name
        case value
        case value_int
        case meaning_up
        case meaning_rev
        case desc
        case suit
    }
}

enum Suit: String, Codable {
    case cups
    case pentacles
    case swords
    case wands 
}

enum Importance: String, Codable {
    case major
    case minor
}
