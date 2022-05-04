//
//  OracleOfTheTarotCards.swift
//  OCRiOSAttempt
//
//  Created by Scott Lydon on 5/3/22.
//

import Foundation

// MARK: - OracleOfTheTarotCard
struct OracleOfTheTarotCard: Codable {
    let card: String
    let oracleOfTheTarotCardDescription: String?
    let meaning: String?
    let wellDignified: String?
    let illDignified: String?
    let keyword: String?

    enum CodingKeys: String, CodingKey {
        case card
        case oracleOfTheTarotCardDescription = "description"
        case meaning = "Meaning"
        case wellDignified = "Well-dignified"
        case illDignified = "Ill-dignified"
        case keyword = "Keyword"
    }
}

typealias OracleOfTheTarotCards = [OracleOfTheTarotCard]
