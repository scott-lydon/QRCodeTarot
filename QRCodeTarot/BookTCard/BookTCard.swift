//
//  BookTCard.swift
//  OCRiOSAttempt
//
//  Created by Scott Lydon on 5/3/22.
//

import Foundation

// MARK: - BookTCard
struct BookTCard: Codable, HasCardString {
    /// "Ace of Wands"
    let card: String

    /// description
    let meaning: String
}

typealias BookTCards = [BookTCard]

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
}
