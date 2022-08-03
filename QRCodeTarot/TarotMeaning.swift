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
        if lhs.suit < rhs.suit {
            return true
        } else if lhs.suit > rhs.suit {
            return false
        } else {
            if lhs.num < rhs.num {
                return true
            } else if lhs.num > rhs.num {
                return false
            } else {
                return false
            }
        }
    }
}
