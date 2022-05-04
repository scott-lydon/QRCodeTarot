//
//  PictoralKeyToTheTarot.swift
//  OCRiOSAttempt
//
//  Created by Scott Lydon on 5/3/22.
//
import Foundation

// MARK: - PictoralKeyToTheTarotCard
struct PictoralKeyToTheTarotCard: Codable {
    let card: String
    let pictoralKeyToTheTarotCardDescription: String

    enum CodingKeys: String, CodingKey {
        case card
        case pictoralKeyToTheTarotCardDescription = "description"
    }
}

typealias PictoralKeyToTheTarotCards = [PictoralKeyToTheTarotCard]
