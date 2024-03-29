//
//  Cards.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 6/3/22.
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

    // If the version is even then there are some that are two per card.
    // It has two more, because it may have two tarot cards in this one card.
    func tarotCard(from path: String?) -> Card? {
        guard let paths = path?.components(separatedBy: "/"),
              let value = paths.thirdToLast?.int,
              let suit = paths.secondToLast?.lowercased(),
              let deckVersion = paths.last?.int,
              let symbol = CardKey.Symbol(rawValue: suit) else { return nil }
        if deckVersion.isEven {
            guard let tarotSuit: String = paths.fourthToLast,
                  let tarotNumber: Int = paths.fifthToLast?.int,
                  let tarotSuit: CardKey.Symbol = Suit(rawValue: tarotSuit)?.symbol else {
                return nil
            }
            return card(from: CardKey(symbol: tarotSuit, number: tarotNumber, deckVersion: deckVersion))
        }
        return card(from: CardKey(symbol: symbol, number: value, deckVersion: deckVersion))
    }
}
