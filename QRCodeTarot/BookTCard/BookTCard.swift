//
//  BookTCard.swift
//  OCRiOSAttempt
//
//  Created by Scott Lydon on 5/3/22.
//

import Foundation

// MARK: - BookTCard
struct BookTCard: Codable {
    /// "Ace of Wands"
    let card: String

    /// description
    let meaning: String

    var num: Int {
        card.autoTarotNum
    }

    var suit: Suit {
        card.autoSuit
    }
}

typealias BookTCards = [BookTCard]

extension String.SubSequence {
    var string: String {
        String(self)
    }
}
