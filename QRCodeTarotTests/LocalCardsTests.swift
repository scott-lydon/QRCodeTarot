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

    func testCardFromPath() {
        let localCards = Bundle.localCards
        let fiveHearts = localCards.card(from: "/5/hearts/1")
        XCTAssertNotNil(fiveHearts)
        XCTAssertEqual(fiveHearts?.suit, .cups)
        XCTAssertEqual(fiveHearts?.value_int, 5)
    }

    func testCardFromPath2SwordSpade() {
        let localCards = Bundle.localCards
        let fiveHearts = localCards.tarotCard(from: "4/swords/4/spades/2")
        XCTAssertNotNil(fiveHearts)
        XCTAssertEqual(fiveHearts?.suit, .swords)
        XCTAssertEqual(fiveHearts?.value_int, 4)
    }

    func testCardFromPath2WandsSpade() {
        let localCards = Bundle.localCards
        let fiveHearts = localCards.tarotCard(from: "4/wands/4/spades/2")
        XCTAssertNotNil(fiveHearts)
        XCTAssertEqual(fiveHearts?.suit, .wands)
        XCTAssertEqual(fiveHearts?.value_int, 4)
    }

    func testCardFromPath2SwordSpadev1() {
        let localCards = Bundle.localCards
        let fiveHearts = localCards.tarotCard(from: "/4/swords/4/spades/1")
        XCTAssertNotNil(fiveHearts)
        XCTAssertEqual(fiveHearts?.suit, .swords)
        XCTAssertEqual(fiveHearts?.value_int, 4)
    }

    func testCardFromPath2WandsSpadev1() {
        let localCards = Bundle.localCards
        let fiveHearts = localCards.tarotCard(from: "/4/wands/4/spades/1")
        XCTAssertNotNil(fiveHearts)
        XCTAssertEqual(fiveHearts?.suit, .swords)
        XCTAssertEqual(fiveHearts?.value_int, 4)
    }
}
