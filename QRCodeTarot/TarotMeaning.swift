//
//  TarotMeaning.swift
//  QRCodeTarot
//
//  Created by Scott Lydon on 8/3/22.
//

import Foundation


// MARK: - TarotMeaning
struct TarotMeaning: Codable {
    let name, desription, evolved, unevolved: String
    
    var card: Card {
        .init(
            type: .minor,
            name_short: hash,
            name: numSuitName,
            value: num.tarotNumberSpelledOut,
            value_int: num,
            meaning_up: "",
            meaning_rev: "",
            desc: desription,
            suit: suit,
            evolved: evolved,
            unevolved: unevolved
        )
    }

    enum CodingKeys: String, CodingKey {
        case name, desription, evolved
        case unevolved = "Unevolved"
    }
}

extension Array where Element == TarotMeaning {
    
    var cards: [Card] {
        sorted().map(\.card)
    }
}

extension TarotMeaning: HasTarotNum {
    var num: Int {
        name.components(separatedBy: "_").first!.int! // unit tested.
    }
}

extension TarotMeaning: HasTarotSuit {
    var suit: Suit {
        print(name.components(separatedBy: "_"))
        return name.components(separatedBy: "_").last!.suit // unit tested.
    }
}

extension TarotMeaning: Comparable {
    
    static func < (lhs: TarotMeaning, rhs: TarotMeaning) -> Bool {
        lhs.suit < rhs.suit || (lhs.suit == rhs.suit && lhs.num < rhs.num)
    }
}


extension String.SubSequence {
    var string: String {
        String(self)
    }
}

protocol HasCardString: HasTarotNum, HasTarotSuit {
    var card: String { get }
}

extension HasCardString {
    var num: Int {
        card.autoTarotNum
    }

    var suit: Suit {
        card.autoSuit
    }
}

protocol HasTarotNum {
    var num: Int { get }
}

protocol HasTarotSuit {
    var suit: Suit { get }
}

typealias HasTarotNumAndSuit = HasTarotNum & HasTarotSuit

extension HasTarotNum where Self: HasTarotSuit {
    var hash: String {
        num.string + " " + suit.rawValue
    }

    var numSuitName: String {
        "\(num.tarotNumberSpelledOut) of \(suit.rawValue)"
    }
}
