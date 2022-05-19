//
//  Card.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 4/3/22.
//

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
    let evolved: String?
    let unevolved: String?

    var choiceViewModel: ChoiceView.ViewModel {
        .init(text: name, image: image ?? .cardDemo)
    }

    var evolvedViewModels: [LabelLabel.ViewModel] {
        [evolved].compactMap { $0 }.map { .init(topText: "Evolved", bottomText: $0) }
    }

    var unevolvedViewModels: [LabelLabel.ViewModel] {
        [unevolved].compactMap { $0 }.map { .init(topText: "Unevolved", bottomText: $0) }
    }

    static var allCases: [Card] {
        let bookTs: [BookTCard] = try! Bundle.main.bookT?.localCodable() ?? []
        let oracleTCards: [OracleOfTheTarotCard] = try! Bundle.main.oracleOfTarot?.localCodable() ?? []
        let pictoralCards: [PictoralKeyToTheTarotCard] = try! Bundle.main.oracleOfTarot?.localCodable() ?? []

        let bookTDictionary = Dictionary(uniqueKeysWithValues: bookTs.map{ ($0.hash, $0) })
        let oracleDictionary = Dictionary(uniqueKeysWithValues: oracleTCards.map { ($0.hash, $0)})
        let pictoralDictionary = Dictionary(uniqueKeysWithValues: pictoralCards.map { ($0.hash, $0)})

        print(bookTs.count, oracleTCards.count, pictoralCards.count)

        var cards: [Card] = []
        for suit in Suit.allCases {
            for num in 1..<14 {
                let hash = num.string + " " + suit.rawValue
                let bookT = bookTDictionary[hash]
                let oracle = oracleDictionary[hash]
                let pictoral = pictoralDictionary[hash]
                cards.append(
                    Card(
                        type: .minor,
                        name_short: hash,
                        name: "\(num.tarotNumberSpelledOut) of \(suit.rawValue)",
                        value: num.tarotNumberSpelledOut,
                        value_int: num,
                        meaning_up: bookT?.meaning ?? "",
                        meaning_rev: (oracle?.meaning ?? "") + " " + (oracle?.oracleOfTheTarotCardDescription ?? ""),
                        desc: pictoral?.pictoralKeyToTheTarotCardDescription ?? "",
                        suit: suit,
                        evolved: oracle?.wellDignified ?? "",
                        unevolved: oracle?.illDignified ?? ""
                    )
                )
            }
        }
        return cards
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
        case evolved
        case unevolved
    }
}

enum Suit: String, Codable, CaseIterable {
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
