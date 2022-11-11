//
//  QRViewControllerTests.swift
//  QRCodeTarotTests
//
//  Created by Scott Lydon on 4/5/22.
//

import XCTest
import QRCodeReader
@testable import QRCodeTarot

class ViewControllerTests: XCTestCase {

    func testCardKeyCases() {
        XCTAssertEqual(CardKey.Symbol.clubs.suit, .wands)
        XCTAssertEqual(CardKey.Symbol.spades.suit, .swords)
        XCTAssertEqual(CardKey.Symbol.diamonds.suit, .pentacles)
    }
}
