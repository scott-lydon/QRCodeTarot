//
//  Card.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

import Foundation
import UIKit
import Callable

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



// MARK: - Card
struct Card: Codable, CaseIterable {
    let type: Importance
    let name_short: String
    let name: String
    let value: String
    let value_int: Int
    let meaning_up: String
    let meaning_rev: String
    let desc: String
    let suit: Suit?

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name, image: image ?? .cardDemo)
    }

    static var allCases: [Card] {
        let bookTs: [BookTCard] = try! Bundle.main.bookT?.localCodable() ?? []
        let oracleTCards: [OracleOfTheTarotCard] = try! Bundle.main.oracleOfTarot?.localCodable() ?? []
        let pictoralCards: [PictoralKeyToTheTarotCard] = try! Bundle.main.oracleOfTarot?.localCodable() ?? []
        print(bookTs.count, oracleTCards.count, pictoralCards.count)

        return []
    }

    var image: UIImage? {
        UIImage(named: "\(value_int.leadingZero)_\(suit?.rawValue ?? "")")
    }

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

    var symbol: CardKey.Symbol {
        .init(suit: self)
    }
}

enum Importance: String, Codable {
    case major
    case minor
}
