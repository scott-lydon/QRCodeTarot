//
//  BookTCard.swift
//  OCRiOSAttempt
//
//  Created by Scott Lydon on 5/3/22.
//

import Foundation

// MARK: - BookTCard
struct BookTCard: Codable {
    let card, meaning: String
}

typealias BookTCards = [BookTCard]
