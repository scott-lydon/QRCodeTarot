//
//  QRViewControllerTests.swift
//  QRCodeTarotTests
//
//  Created by Scott Lydon on 4/5/22.
//

@testable import Pointy_Hat_Tarot
import XCTest

class ViewControllerTests: XCTestCase {
    func testCardKeyCases() {
        XCTAssertEqual(CardKey.Symbol.clubs.suit, .wands)
        XCTAssertEqual(CardKey.Symbol.spades.suit, .swords)
        XCTAssertEqual(CardKey.Symbol.diamonds.suit, .pentacles)
    }
}
