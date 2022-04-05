//
//  LocalCardsTests.swift
//  QRCodeTarotTests
//
//  Created by Scott Lydon on 4/4/22.
//


import XCTest
@testable import QRCodeTarot

class LocalCardsTests: XCTestCase {

    func testCardFromCardKey() {
        let localCards = Bundle.localCards
        XCTAssertNotNil(localCards)
        let fiveHearts = localCards.card(
            from: CardKey(
                symbol: .hearts,
                number: 5,
                deckVersion: 1
            )
        )
        XCTAssertTrue(localCards.cards.contains(where: { $0.suit == .cups}))
        XCTAssertTrue(
            localCards.cards.contains(where: { $0.value_int == 5 }),
            "\(localCards.cards.map(\.value_int))"
        )
        XCTAssertNotNil(fiveHearts)
        XCTAssertEqual(fiveHearts?.value_int, 5)
        XCTAssertEqual(fiveHearts?.suit, .cups)
    }
}
